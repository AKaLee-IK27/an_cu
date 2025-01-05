import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/CommonWidget/asset_check_widget_cloudinary.dart';
import 'package:an_cu/Utils/CommonWidget/custom_sized_box.dart';
import 'package:an_cu/Utils/CommonWidget/my_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerWidget {
  SettingScreen({super.key});
  
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(color: AppColors.secondary),
          title: const Text('Cài đặt'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.1,
                  width: screenHeight * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      ClipOval(
                        child: SizedBox.expand(
                          child: AssetCheckWidget(publicId: 'ancuconnect/${currentUser?.email}')
                        )
                      ),
                    ]
                  ),
                ),
                
                const CustomSizedBox(),
          
                Text(
                  currentUser?.displayName ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.06,
                      color: AppColors.primary),
                ),

                const CustomSizedBox(percentageScreenHeight: 0.02,),

                MyButton(
                  text: const Text(
                    'Tài Khoản',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  alignmentItem: Alignment.centerLeft,
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  icon: const Icon(Icons.account_circle, color: Colors.black, size: 30,),
                  onPressed: () {
                    router.goAccount();
                  }
                ),

                const CustomSizedBox(),

                MyButton(
                  text: const Text(
                    'Liên Hệ Hỗ Trợ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  alignmentItem: Alignment.centerLeft,
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  icon: const Icon(Icons.info_outline_rounded, color: Colors.black, size: 30,),
                  onPressed: () {
                    
                  }
                ),
              ]
            )
          )
        )
      )
    );
  }
}