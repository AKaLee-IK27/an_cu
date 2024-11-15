import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier(this._fireStoreService) : super([]);

  final FireStoreService _fireStoreService;

  Future<void> getPosts() async {
    final postsData = await _fireStoreService.getPosts();
    for (var post in postsData) {
      print(
        Post.fromJson(post).toString(),
      );
    }
  }
}

final postController = StateNotifierProvider<PostNotifier, List<Post>>(
  (ref) => PostNotifier(ref.read(fireStoreServiceProvider)),
);
