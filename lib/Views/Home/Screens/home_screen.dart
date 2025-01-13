import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/CommonWidget/asset_check_widget_cloudinary.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:an_cu/Views/Home/Screens/all_post_screen.dart';
import 'package:an_cu/Views/Home/Widgets/appbar_content.dart';
import 'package:an_cu/Views/Home/Widgets/main_drawer.dart';
import 'package:an_cu/Views/Home/Widgets/main_search_bar.dart';
import 'package:an_cu/Views/Post/Widgets/post_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final User? user = FirebaseAuth.instance.currentUser;
    final List<Post> posts = ref.watch(postController);

    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          endDrawer: const MainDrawer(),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () async {
                await router.goChatBot();
              },
              child: const Icon(
                Icons.chat,
                color: AppColors.white,
              ),
            );
          }),
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) => SizedBox.square(
                  dimension: kToolbarHeight,
                  child: IconButton(
                    icon: ClipOval(
                      child: SizedBox.expand(
                          child: AssetCheckWidget(
                              publicId: 'ancuconnect/${user?.email}')),
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              )
            ],
            titleSpacing: 0,
            title: const AppBarContent(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MainSearchBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Column(
                    children: [
                      // header list real estate
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bất động sản nổi bật',
                            style: AppTextStyles.title,
                          ),
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(postController.notifier)
                                  .searchPostByProvince("");

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPostsScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Xem tất cả',
                              style: AppTextStyles.body,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: ScreenSize.width(context),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (posts.isEmpty)
                                const Center(
                                  child: Text('Không có bài đăng nào.'),
                                )
                              else
                                for (var post in posts.take(3).toList())
                                  PostCard(post: post),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
