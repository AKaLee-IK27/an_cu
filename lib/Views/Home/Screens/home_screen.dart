import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Home/Widgets/appbar_content.dart';
import 'package:an_cu/Views/Home/Widgets/main_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          drawer: const Drawer(),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {},
              child: const Icon(
                Icons.chat,
                color: AppColors.white,
              ),
            );
          }),
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
            titleSpacing: 0,
            title: const AppBarContent(),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                MainSearchBar(),
              ],
            ),
          )),
    );
  }
}
