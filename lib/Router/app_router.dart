import 'package:an_cu/Router/not_found_screen.dart';
import 'package:an_cu/Views/Home/Screens/home_screen.dart';
import 'package:an_cu/Views/Onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute {
  home,
  onboarding,
  splash,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/${AppRoute.home.name}',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/${AppRoute.onboarding.name}',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: OnboardingScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
