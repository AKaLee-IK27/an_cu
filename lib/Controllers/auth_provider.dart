import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier();
});

class AuthNotifier with ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void signIn() {
    _isAuth = true;
    notifyListeners();
  }

  void signOut() {
    _isAuth = false;
    notifyListeners();
  }
}
