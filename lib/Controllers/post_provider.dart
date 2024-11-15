import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier(this._fireStoreService) : super([]);

  final FireStoreService _fireStoreService;

  // Future<void> getPosts() async {
  //   final posts = await _fireStoreService.getPosts();
  //   state = posts;
  // }

  // Future<void> addPost(Post post) async {
  //   final posts = await _fireStoreService.addPost(post);
  //   state = posts;
  // }

  // Future<void> updatePost(Post post) async {
  //   final posts = await _fireStoreService.updatePost(post);
  //   state = posts;
  // }

  // Future<void> deletePost(Post post) async {
  //   final posts = await _fireStoreService.deletePost(post);
  //   state = posts;
  // }
}

final postController = StateNotifierProvider<PostNotifier, List<Post>>(
  (ref) => PostNotifier(ref.read(fireStoreServiceProvider)),
);
