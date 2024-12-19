import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Services/fire_store_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier(this._fireStoreService, this.user) : super([]);

  final FirebaseFirestore _fireStoreService;
  final User user;

  Future<void> addPost(Post post) async {
    try {
      await _fireStoreService
          .collection('Posts')
          .doc(user.uid)
          .set(post.toJson())
          .onError((e, _) => print(e));

      state = [...state, post];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPosts() async {
    try {
      final posts = await _fireStoreService.collection('Posts').get();
      state = posts.docs.map((e) => Post.fromJson(e.data())).toList();
    } catch (e) {
      print(e);
    }
  }
}

final postController = StateNotifierProvider<PostNotifier, List<Post>>(
  (ref) => PostNotifier(
    ref.watch(firebaseFireStoreProvider),
    ref.watch(userProvider),
  ),
);
