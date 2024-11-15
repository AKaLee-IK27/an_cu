import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

class FireStoreService {
  final FirebaseFirestore _firestore;
  final Ref _ref;

  FireStoreService(this._firestore, this._ref);
}

final fireStoreServiceProvider = Provider<FireStoreService>((ref) {
  return FireStoreService(ref.read(firebaseFireStoreProvider), ref);
});
