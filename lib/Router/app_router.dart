import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Views/Account/Screens/account_screen.dart';
import 'package:an_cu/Views/Authentication/Screens/sign_in_screen.dart';
import 'package:an_cu/Views/Authentication/Screens/sign_up_screen.dart';
import 'package:an_cu/Views/Authentication/Screens/verification_screen.dart';
import 'package:an_cu/Views/ChatBot/chat_history_screen.dart';
import 'package:an_cu/Views/ChatBot/chat_screen.dart';
import 'package:an_cu/Views/Post/Screens/add_post_screen.dart';
import 'package:an_cu/Views/Post/Screens/manage_post_screen.dart';
import 'package:an_cu/Views/Post/Screens/post_detail_screen.dart';
import 'package:an_cu/Views/Setting/setting_screen.dart';
import 'package:an_cu/Views/Support/Screen/support_screen.dart';
import 'package:an_cu/Views/Wishlist/Screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Views/Home/Screens/home_screen.dart';
import '../Views/Onboarding/onboarding_screen.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute {
  home,
  onboarding,
  splash,
  postDetail,
  addPost,
  signIn,
  signUp,
  verification,
  chatBot,
  account,
  setting,
  managePost,
  wishlist,
  support,
  historyChat,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final localStore = ref.read(localStoreProvider);
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          if (await localStore.getBool('isStarted') != true) {
            return '/${AppRoute.onboarding.name}';
          } else if (await localStore.getBool('isLoggedIn') == true) {
            return '/${AppRoute.home.name}';
          } else {
            return '/${AppRoute.signIn.name}';
          }
          //return '/${AppRoute.account.name}';
        },
      ),
      GoRoute(
          path: '/${AppRoute.home.name}',
          name: AppRoute.home.name,
          pageBuilder: (context, state) =>
              const MaterialPage(child: HomeScreen()),
          redirect: (context, state) async {
            if ((await localStore.getBool('isStarted') != true) ||
                (await localStore.getBool('isLoggedIn') != true)) {
              return '/';
            }
            return '/${AppRoute.home.name}';
          }),
      GoRoute(
          path: '/${AppRoute.onboarding.name}',
          name: AppRoute.onboarding.name,
          pageBuilder: (context, state) =>
              const MaterialPage(child: OnboardingScreen()),
          redirect: (context, state) async {
            if (await localStore.getBool('isStarted') == true) {
              return '/';
            }
            return '/${AppRoute.onboarding.name}';
          }),
      GoRoute(
          path: '/${AppRoute.postDetail.name}/:id',
          name: AppRoute.postDetail.name,
          pageBuilder: (context, state) {
            final id = state.pathParameters['id'];
            if (id == null) {
              return const MaterialPage(child: HomeScreen());
            }

            final post =
                ref.read(postController).firstWhere((post) => post.id == id);
            return MaterialPage(
                child: PostDetailScreen(
              post: post,
            ));
          }),
      GoRoute(
          path: '/${AppRoute.signIn.name}',
          name: AppRoute.signIn.name,
          pageBuilder: (context, state) => MaterialPage(
                child: SignInScreen(),
              ),
          redirect: (context, state) async {
            if ((await localStore.getBool('isStarted') != true) ||
                (await localStore.getBool('isLoggedIn') == true)) {
              return '/';
            }
            return '/${AppRoute.signIn.name}';
          }),
      GoRoute(
          path: '/${AppRoute.signUp.name}',
          name: AppRoute.signUp.name,
          pageBuilder: (context, state) => MaterialPage(
                child: SignUpScreen(),
              ),
          redirect: (context, state) async {
            if ((await localStore.getBool('isStarted') != true) ||
                (await localStore.getBool('isLoggedIn') == true)) {
              return '/';
            }
            return '/${AppRoute.signUp.name}';
          }),
      GoRoute(
        path: '/${AppRoute.verification.name}',
        name: AppRoute.verification.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: VerificationScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.addPost.name}',
        name: AppRoute.addPost.name,
        pageBuilder: (context, state) => MaterialPage(child: AddPostScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.chatBot.name}',
        name: AppRoute.chatBot.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ChatScreen()),
      ),
      GoRoute(
          path: '/${AppRoute.account.name}',
          name: AppRoute.account.name,
          pageBuilder: (context, state) => MaterialPage(child: AccountScreen()),
          redirect: (context, state) async {
            if (await localStore.getBool('isLoggedIn') != true) {
              return '/${AppRoute.signIn.name}';
            }
            return '/${AppRoute.account.name}';
          }),
      GoRoute(
        path: '/${AppRoute.setting.name}',
        name: AppRoute.setting.name,
        pageBuilder: (context, state) => MaterialPage(child: SettingScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.managePost.name}',
        name: AppRoute.managePost.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ManagePostScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.wishlist.name}',
        name: AppRoute.wishlist.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: WishlistScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.support.name}',
        name: AppRoute.support.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SupportScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.historyChat.name}',
        name: AppRoute.historyChat.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ChatHistoryScreen()),
      ),

      // Add more routes here
    ],
  );
}

extension GoRouterX on GoRouter {
  Future<void> goInit() async {
    go('/');
  }

  Future<void> goHome() async {
    go('/${AppRoute.home.name}');
  }

  Future<void> goBack() async {
    if (_key.currentState!.canPop()) {
      _key.currentState!.pop();
    }
  }

  Future<void> goOnboarding() async {
    go('/${AppRoute.onboarding.name}');
  }

  Future<void> goPostDetail(id) async {
    go('/${AppRoute.postDetail.name}/$id');
  }

  Future<void> goSplash() async {
    go('/${AppRoute.splash.name}');
  }

  Future<void> goSignIn() async {
    go('/${AppRoute.signIn.name}');
  }

  Future<void> goSignUp() async {
    go('/${AppRoute.signUp.name}');
  }

  Future<void> goVerification() async {
    go('/${AppRoute.verification.name}');
  }

  Future<void> goAddPost() async {
    go('/${AppRoute.addPost.name}');
  }

  Future<void> goChatBot() async {
    go('/${AppRoute.chatBot.name}');
  }

  Future<void> goAccount() async {
    go('/${AppRoute.account.name}');
  }

  Future<void> goSetting() async {
    go('/${AppRoute.setting.name}');
  }

  Future<void> goManagePost() async {
    go('/${AppRoute.managePost.name}');
  }

  Future<void> goWishlist() async {
    go('/${AppRoute.wishlist.name}');
  }

  Future<void> goSupport() async {
    go('/${AppRoute.support.name}');
  }
}
