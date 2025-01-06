import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Controllers/wishlist_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Wishlist/Widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(color: AppColors.secondary),
          title: const Text('Bài đăng yêu thích'),
        ),
        body: FutureBuilder<List<Post>>(
          future: ref.read(wishlistController.notifier).getPostsWishlistsByUID(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Lỗi: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Không có bài đăng nào.'));
            }

            final posts = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: 8,
              ),
              child: SizedBox(
                width: ScreenSize.width(context),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: posts.map((post) => PostCard(post: post)).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}