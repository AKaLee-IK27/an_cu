import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Home/Widgets/appbar_content.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/search_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: SearchBar(),
                  ),
                ),
                Container(
                  height: 200,
                  color: AppColors.secondary,
                ),
              ],
            ),
          )),
    );
  }
}
