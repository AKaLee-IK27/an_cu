import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

class FireStoreService {
  final FirebaseFirestore _firestore;
  final Ref _ref;

  FireStoreService(this._firestore, this._ref);

  Future<List<Map<String, dynamic>>> getPosts() async {
    CollectionReference posts = _firestore.collection('Post');

    return await posts.get().then((querySnapshot) {
      List<Map<String, dynamic>> posts = querySnapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();

      return posts;
    });
  }

  Future<void> addPost() async {
    CollectionReference posts = _firestore.collection('Post');

    final user = _ref.read(firebaseAuthProvider).currentUser;

    if (user == null) {
      return;
    }

    await posts.add(
      Comment(
        content: "dfads",
        id: '1',
        createdAt: 323,
        createdBy: AppUser(
          id: user.uid,
          email: user.email,
          name: user.displayName,
          phoneNumber: user.phoneNumber,
        ),
      ).toJson(),
    );
  }
}

final fireStoreServiceProvider = Provider<FireStoreService>((ref) {
  return FireStoreService(ref.read(firebaseFireStoreProvider), ref);
});
