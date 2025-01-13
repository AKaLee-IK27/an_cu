import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Services/fire_store_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistNotifier extends StateNotifier<List<Post>> {
  WishlistNotifier(this._fireStoreService, this.user, this.postNotifier) : super([]) {
    getPostsWishlistsByUID(user.uid);
  }
  
  final FirebaseFirestore _fireStoreService;
  final User user;
  final PostNotifier postNotifier;

  Future<void> getWishlists() async {
    try {
      await _fireStoreService.collection('Wishlists').get().then((querySnapshot) {
        print("Successfully fetched posts");
        for (var doc in querySnapshot.docs) {
          print(doc.data());
          // final wishlist = Wishlist.fromJson(doc.data());

          // state = [...state, wishlist];
        }
      }, onError: (e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addPostToWishList(Post post) async {
    try {
      final idWishlist = await getWishlistsByUID(user.uid);
      await _fireStoreService
        .collection('Wishlists')
        .doc(idWishlist)
        .update({
          'idPosts': FieldValue.arrayUnion([post.id]),
        });
        
      state = [...state, post];
    } catch (e) {
      print(e);
    }
  }

  Future<void> removePostFromWishlist(Post post) async {
  try {
    final idWishlist = await getWishlistsByUID(user.uid);
    await _fireStoreService
        .collection('Wishlists')
        .doc(idWishlist)
        .update({
      'idPosts': FieldValue.arrayRemove([post.id]),
    });

    state = state.where((postWishlist) => postWishlist.id != post.id).toList();
    print("Successfully removed post ID: ${post.id} from wishlist: $idWishlist");
  } catch (e) {
    print("Error removing post from wishlist: $e");
  }
}

  Future<String> getWishlistsByUID(String uid) async {
    try {
      final snapshot = await _fireStoreService
        .collection('Wishlists')
        .where('idUser', isEqualTo: uid)
        .limit(1)
        .get();

        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs[0].id;
        }
    } catch (e) {
      return "";
    }
    return "";
  }

  Future<List<Post>> getPostsWishlistsByUID(String uid) async {
    try {
      final snapshot = await _fireStoreService
        .collection('Wishlists')
        .where('idUser', isEqualTo: uid)
        .limit(1)
        .get();

      print("Successfully fetched wishlist");

      if (snapshot.docs.isNotEmpty) {
        final wishlist = Wishlist.fromJson(snapshot.docs[0].data() as Map<String, dynamic>);
        
        List<Post> posts = [];
        for (var idPost in wishlist.idPosts) {
          final response = await postNotifier.getPostById(idPost);
          if (response != null) {
            posts.add(response);
            state = [...state, response];
          }
        }

        

        print("Posts fetched: $posts");
        return posts;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

final wishlistController = StateNotifierProvider<WishlistNotifier, List<Post>>(
  (ref) => WishlistNotifier(
    ref.watch(firebaseFireStoreProvider),
    ref.watch(userProvider),
    ref.watch(postController.notifier),
  ),
);
