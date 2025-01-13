import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Post/Widgets/post_card_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManagePostScreen extends ConsumerWidget {
  const ManagePostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final List<Post> allPosts = ref.watch(postController);
    final posts = allPosts.where((post) => post.createdBy == user.uid).toList();
    print(user.uid);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(color: AppColors.secondary),
          title: const Text('Quản lý bài đăng'),
        ),
        body: posts.isEmpty
          ? const Center(
              child: Text('Không có bài đăng nào.'),
          )
          : Padding(
            padding: const EdgeInsets.symmetric(
                  horizontal: 8,
            ),
            child: SizedBox(
              width: ScreenSize.width(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: posts.map((post) => PostCardManage(post: post)).toList(),
                ),
              ),
            ),
          ),
      ),
    );
  }
}