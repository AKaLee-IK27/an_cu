import 'package:an_cu/Model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserConverter on User {
  AppUser toAppUser() {
    return AppUser(
      id: uid,
      email: email,
      name: displayName,
      phoneNumber: phoneNumber,
    );
  }
}
