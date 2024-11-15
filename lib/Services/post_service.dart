import 'package:an_cu/Model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fireStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

class FireStoreService {
  final FirebaseFirestore _firestore;

  FireStoreService(this._firestore);

  Future<Either<String, List<Post>>> getPosts() async {
    try {
      final response = await _firestore.collection('Post').get();
      final posts = response.docs.map((e) => Post.fromJson(e.data())).toList();
      print(posts);
      return right(posts);
    } on FirebaseException catch (e) {
      print(e.message);
      return left(e.message ?? 'Failed to get posts');
    }
  }
}

final fireStoreServiceProvider = Provider<FireStoreService>(
  (ref) => FireStoreService(
    ref.read(fireStoreProvider),
  ),
);
