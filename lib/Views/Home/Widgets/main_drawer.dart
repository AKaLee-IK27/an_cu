import 'package:an_cu/Controllers/auth_controller.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final localStore = ref.read(localStoreProvider);
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/demo_avatar.png'),
              ),
            ),
            accountName: Text(
              '${user?.displayName}',
              style: AppTextStyles.title.copyWith(
                color: AppColors.white,
              ),
            ),
            accountEmail: Text('${user?.email}'),
            decoration: const BoxDecoration(color: AppColors.primary),
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.home,
          //     size: 32,
          //     color: AppColors.secondary,
          //   ),
          //   title: Text(
          //     'Home',
          //     style: AppTextStyles.title,
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     router.goHome();
          //   },
          // ),
          MainDrawerItem(
            title: 'Tạo bài viết',
            icon: Icons.add,
            onTap: () {
              router.goAddPost();
            },
          ),
          MainDrawerItem(
            title: 'Tài khoản',
            icon: Icons.account_circle,
            onTap: () {
              router.goAccount();
            },
          ),
          MainDrawerItem(
            title: 'Cài đặt',
            icon: Icons.settings,
            onTap: () {},
          ),
          MainDrawerItem(
            title: 'Đăng xuất',
            icon: Icons.logout,
            onTap: () async {
              await ref.read(authController.notifier).logout();
              localStore.setBool('isLoggedIn', false);
              router.goSignIn();
            },
          ),
        ],
      ),
    );
  }
}

class MainDrawerItem extends ConsumerWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  const MainDrawerItem(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: AppColors.secondary,
      ),
      title: Text(
        title,
        style: AppTextStyles.title,
      ),
      onTap: onTap,
    );
  }
}
