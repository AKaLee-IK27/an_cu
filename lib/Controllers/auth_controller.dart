import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/State/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  AuthNotifier(this._authService) : super(const AuthenticationState.initial());

  final FireAuthService _authService;
  final bool isSignedIn = false;

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _authService.login(email: email, password: password);
  
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response!),
    );
  }

  Future<void> signup(
      {required String email,
      required String password,
      required String displayName}) async {
    state = const AuthenticationState.loading();
    final response = await _authService.signup(
      email: email,
      password: password,
      displayName: displayName,
    );
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response),
    );
  }

  Future<void> continueWithGoogle() async {
    state = const AuthenticationState.loading();
    final response = await _authService.continueWithGoogle();
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) => AuthenticationState.authenticated(user: response),
    );
  }

  Future<void> logout() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    state = const AuthenticationState.loading();
    if (await _googleSignIn.isSignedIn()){
      _googleSignIn.signOut();
    }
    final response = await _authService.logout();
    state = response.fold(
      (error) => AuthenticationState.unauthenticated(message: error),
      (response) =>
          const AuthenticationState.unauthenticated(message: 'Logged Out'),
    );
    
  }
}

final authController = StateNotifierProvider<AuthNotifier, AuthenticationState>(
  (ref) => AuthNotifier(ref.read(fireAuthServiceProvider)),
);
