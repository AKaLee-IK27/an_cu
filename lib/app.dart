import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/logo.svg'),
              ],
            ),
            const Text('Đăng nhập')
          ],
        )),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
