import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Post/Widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllPostsScreen extends ConsumerWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Post> allPosts = ref.watch(postController);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.secondary,
              )),
          title: const Text('Tất cả bài đăng'),
        ),
        body: allPosts.isEmpty
            ? const Center(
                child: Text('Không có bài đăng nào.'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: ScreenSize.width(context),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          allPosts.map((post) => PostCard(post: post)).toList(),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
