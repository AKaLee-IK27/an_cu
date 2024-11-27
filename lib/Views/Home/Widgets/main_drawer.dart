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
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 32,
              color: AppColors.secondary,
            ),
            title: Text(
              'Home',
              style: AppTextStyles.title,
            ),
            onTap: () {
              Navigator.pop(context);
              router.goHome();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 32,
              color: AppColors.secondary,
            ),
            title: Text(
              'Account',
              style: AppTextStyles.title,
            ),
            onTap: () {
              //
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 32,
              color: AppColors.secondary,
            ),
            title: Text(
              'Log out',
              style: AppTextStyles.title,
            ),
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
