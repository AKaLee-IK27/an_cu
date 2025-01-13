import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Services/fire_store_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier(this._fireStoreService, this.user) : super([]) {
    getPosts();
  }

  final FirebaseFirestore _fireStoreService;
  final User user;
  final List<Post> originalPost = [];

  Future<void> addPost(Post post) async {
    try {
      print(post.toJson());
      await _fireStoreService
          .collection('Posts')
          .doc()
          .set(post.toJson())
          .onError((e, _) => print(e));

      state = [...state, post];
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchPostByProvince(String province) async {
    print("Search by province: $province");
    print(originalPost.length);
    if (province == "") {
      state = originalPost;
      return;
    }

    state = originalPost
        .where((post) => post.property?.province == province)
        .toList();
  }

  Future<void> getPosts() async {
    try {
      await _fireStoreService.collection('Posts').get().then((querySnapshot) {
        print("Successfully fetched posts");
        for (var doc in querySnapshot.docs) {
          // print(doc.data());
          final post = Post.fromJson(doc.data()).copyWith(id: doc.id);

          state = [...state, post];
        }
        originalPost.addAll(state);
      }, onError: (e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePost(Post deletePost) async {
    try {
      await _fireStoreService
          .collection('Posts')
          .doc(deletePost.id)
          .delete()
          .onError((e, _) => print(e));

      state = state.where((post) => post.id != deletePost.id).toList();
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

  Future<List<Post>> getDocumentsByCreateBy(String createdBy) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreService
          .collection('Posts')
          .where('createdBy', isEqualTo: createdBy)
          .get();

      List<Post> listPost = querySnapshot.docs.map((doc) {
        return Post.fromJson(doc.data() as Map<String, dynamic>)
            .copyWith(id: doc.id);
      }).toList();

      return listPost;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<Post?> getPostById(String id) async {
    try {
      DocumentSnapshot snapshot =
          await _fireStoreService.collection('Posts').doc(id).get();

      return Post.fromJson(snapshot.data() as Map<String, dynamic>)
          .copyWith(id: id);
    } catch (e) {
      return null;
    }
  }
}

final postController = StateNotifierProvider<PostNotifier, List<Post>>(
  (ref) => PostNotifier(
    ref.watch(firebaseFireStoreProvider),
    ref.watch(userProvider),
  ),
);
