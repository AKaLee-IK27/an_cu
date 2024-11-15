import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Views/Post/Screens/post_detail_screen.dart';
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
          if (await localStore.getBool('isStarted') == null) {
            return '/${AppRoute.onboarding.name}';
          } else {
            return '/${AppRoute.home.name}';
          }
        },
      ),
      GoRoute(
        path: '/${AppRoute.home.name}',
        name: AppRoute.home.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        path: '/${AppRoute.onboarding.name}',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OnboardingScreen()),
      ),
      GoRoute(
          path: '/${AppRoute.postDetail.name}/:id',
          name: AppRoute.postDetail.name,
          pageBuilder: (context, state) {
            final id = state.pathParameters['id'];
            if (id == null) {
              return const MaterialPage(child: HomeScreen());
            }
            return const MaterialPage(child: PostDetailScreen());
          }),
      // Add more routes here
    ],
  );
}

extension GoRouterX on GoRouter {
  void goHome() {
    go('/${AppRoute.home.name}');
  }

  void goOnboarding() {
    go('/${AppRoute.onboarding.name}');
  }

  void goPostDetail({required String id}) {
    go('/${AppRoute.postDetail.name}/$id');
  }

  void goSplash() {
    go('/${AppRoute.splash.name}');
  }
}
