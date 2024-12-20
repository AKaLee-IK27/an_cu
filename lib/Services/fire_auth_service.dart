import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final userProvider = Provider<User>((ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user != null) {
    return user;
  } else {
    throw Exception('User is not logged in');
  }
});

class FireAuthService {
  final FirebaseAuth _firebaseAuth;
  final Ref _ref;

  FireAuthService(this._firebaseAuth, this._ref);

  Future<Either<String, User>> signup(
      {required String email,
      required String password,
      required String displayName}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      response.user!.updateDisplayName(displayName);
      User user = response.user!;
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'displayName': displayName,
        'email': email,
        'uid': user.uid,
      });

      return right(response.user!);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Signup.');
    }
  }

  Future<Either<String, User?>> login(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(response.user);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Login');
    }
  }

  Future<Either<String, User>> continueWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final response = await _firebaseAuth.signInWithCredential(credential);
        return right(response.user!);
      } else {
        return left('Unknown Error');
      }
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Unknow Error');
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Logout');
    }
  }

  Future<Either<String, void>> fetchUserById({required String userId}) async {
    try {
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Failed to Reset Password');
    }
  }
}

final fireAuthServiceProvider = Provider<FireAuthService>(
  (ref) => FireAuthService(ref.read(firebaseAuthProvider), ref),
);
