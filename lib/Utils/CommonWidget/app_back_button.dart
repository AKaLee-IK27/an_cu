import 'dart:ui';

import 'package:an_cu/Router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBackButton extends ConsumerWidget {
  final Color color;
  final Function()? onTap; 

  const MyBackButton({
    super.key,
    this.color = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap ?? () {
          router.goHome();
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 36,
          width: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
