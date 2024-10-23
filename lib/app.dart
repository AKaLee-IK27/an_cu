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
                SvgPicture.asset(
                  'assets/logo/main.svg',
                  fit: BoxFit.contain,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  "An Cư Connect",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
