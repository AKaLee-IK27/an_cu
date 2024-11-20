import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Services/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final localStore = ref.read(localStoreProvider);

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
              'Anh Khôi',
              style: AppTextStyles.title.copyWith(
                color: AppColors.white,
              ),
            ),
            accountEmail: const Text('khoile0908540@gmail.com'),
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
              Icons.account_circle,
              size: 32,
              color: AppColors.secondary,
            ),
            title: Text(
              'Logout',
              style: AppTextStyles.title,
            ),
            onTap: () {
              //
              localStore.setBool('isLoggedIn', false);
              router.goSignIn();
            },
          ),
        ],
      ),
    );
  }
}
