import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

class FireStoreService {
  final FirebaseFirestore _firestore;
  final Ref _ref;

  FireStoreService(this._firestore, this._ref);

  Future<List<Map<String, dynamic>>> getPosts() async {
    CollectionReference posts = _firestore.collection('Post');

    return await posts.get().then((querySnapshot) {
      List<Map<String, dynamic>> posts = querySnapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();

      return posts;
    });
  }

  Future<void> addPost() async {
    CollectionReference posts = _firestore.collection('Post');

    final user = _ref.read(firebaseAuthProvider).currentUser;

    if (user == null) {
      return;
    }

    Post newPost = Post(
      id: '1',
      title: 'New Post',
      avgStar: 5,
      content: 'This is a new post',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      property: const Property(
        address: 'New Address',
        province: Province(
          name: 'Province Name',
          districts: [
            District(name: 'District Name'),
          ],
        ),
        district: District(name: 'District Name'),
        price: 100000,
        area: 100,
        bedRoom: 2,
        bathRoom: 2,
        floor: 2,
        description: 'This is a new property',
        images: ['image1', 'image2'],
        hasFurniture: true,
        propertyType: 'apartment',
        direction: 'north',
      ),
      createdBy: AppUser(
        id: user.uid,
        email: user.email,
        name: user.displayName,
        phoneNumber: user.phoneNumber,
      ),
      verified: true,
      comments: [
        Comment(
          id: '1',
          content: 'This is a new comment',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          createdBy: AppUser(
            id: user.uid,
            email: user.email,
            name: user.displayName,
            phoneNumber: user.phoneNumber,
          ),
        ),
      ],
      status: 'pending',
    );

    await posts.add(newPost.toJson());
  }
}

final fireStoreServiceProvider = Provider<FireStoreService>((ref) {
  return FireStoreService(ref.read(firebaseFireStoreProvider), ref);
});
