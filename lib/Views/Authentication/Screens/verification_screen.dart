import 'package:an_cu/Controllers/auth_controller.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Authentication/Widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({super.key});

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  // void signUserIn(WidgetRef ref) {
  //   ref.read(authController.notifier).login(
  //     email: emailController.text,
  //     password: passwordController.text,  
  //   );
  // }

  // void signInWithGoogle(WidgetRef ref) {
  //   ref.read(authController.notifier).continueWithGoogle();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAuth mAuth = FirebaseAuth.instance;
    final User? user = mAuth.currentUser;
    final router = ref.watch(goRouterProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    screenWidth = (screenWidth < (screenHeight / 2)) ? screenWidth : screenHeight / 2;
    final localStore = ref.read(localStoreProvider);

    user?.sendEmailVerification();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenHeight / 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  SvgPicture.asset(
                    'assets/logo/main.svg',
                    width: screenWidth * 0.2,
                  ),
              
                  const CustomSizedBox(),
              
                  Image.asset(
                    'assets/logo/brand_name.png',
                    width: screenWidth * 0.4,
                  ),
                  //email textfield
              
                  const CustomSizedBox(),
              
                  Text(
                    "Liên kết xác minh đã được gửi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.055,
                        color: Colors.black),
                  ),
              
                  const CustomSizedBox(),
              
                  Text(
                    "Vui lòng kiểm tra email của bạn. Nếu bạn chưa nhận được email, vui lòng kiểm tra hộp thư spam.",
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: screenWidth * 0.035,),
                    textAlign: TextAlign.center,
                  ),
                  
                  const CustomSizedBox(),
              
                  Text(
                    '${user!.email}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.055,
                        color: AppColors.primary),
                  ),
                
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => {
                      user.sendEmailVerification()
                    },
                    child: Text("Gửi lại Email", style: TextStyle(color: Colors.blueAccent, fontSize: screenWidth * 0.04),),
                  ),

                  const CustomSizedBox(),
              
                  MyButton(
                    text: Text("Đã xác minh email", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),),
                    color: AppColors.primary,
                    padding: EdgeInsets.all(screenWidth * 0.035),
                    loading: ref
                      .watch(authController)
                      .maybeWhen(orElse: () => false, loading:() => true),
                    onPressed: () async {
                      User? userTemp = mAuth.currentUser;
                      await userTemp?.reload();
                      if (userTemp?.emailVerified ?? false) {
                        router.goHome();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email has not been verified'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                  ),
                                
                  const CustomSizedBox(),
              
                  MyButton(
                    text: Text("Quay lại đăng nhập", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),),
                    color: AppColors.primary,
                    padding: EdgeInsets.all(screenWidth * 0.035),
                    loading: ref
                      .watch(authController)
                      .maybeWhen(orElse: () => false, loading:() => true),
                    onPressed: () async {
                      await ref.read(authController.notifier).logout();
                      localStore.setBool('isLoggedIn', false);
                      router.goSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.015);
  }
}