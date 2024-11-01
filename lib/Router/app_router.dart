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
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/${AppRoute.onboarding.name}',
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
      // Add more routes here
    ],
  );
}
