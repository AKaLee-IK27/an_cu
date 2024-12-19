import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
