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
      await _fireStoreService.collection('Posts').get().then((querySnapshot) {
        print("Successfully fetched posts");
        for (var doc in querySnapshot.docs) {
          print(doc.data());
          final post = Post.fromJson(doc.data());

          state = [...state, post];
        }
      }, onError: (e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _fireStoreService
          .collection('Posts')
          .doc(user.uid)
          .delete()
          .onError((e, _) => print(e));

      state = state.where((post) => post.id != postId).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      await _fireStoreService
          .collection('Posts')
          .doc(user.uid)
          .update(post.toJson())
          .onError((e, _) => print(e));

      state = state.map((p) => p.id == post.id ? post : p).toList();
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
