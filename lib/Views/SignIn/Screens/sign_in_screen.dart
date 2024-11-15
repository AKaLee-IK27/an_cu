import 'package:an_cu/Controllers/auth_provider.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/SignIn/Widgets/my_button.dart';
import 'package:an_cu/Views/SignIn/Widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    ref.listen(
      authController,
      (previous, next) {
        next.maybeWhen(
          orElse: () => null,
          authenticated: (user) {
            ref.read(goRouterProvider).goHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User ${user.email} Logged In'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          unauthenticated: (message) =>
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message!),
              behavior: SnackBarBehavior.floating,
            ),
          ),
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Center(
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
                "Đăng nhập",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.06,
                    color: Colors.black),
              ),

              const CustomSizedBox(),

              MyTextfield(
                controller: emailController,
                labelText: "Địa chỉ Email",
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold),
                prefixIcon: const Icon(Icons.mail_outline_rounded),
              ),

              //password textfield

              const CustomSizedBox(),

              MyTextfield(
                controller: passwordController,
                labelText: "Mật khẩu",
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold),
                obscureText: true,
              ),

              //sign in button

              const CustomSizedBox(),

              MyButton(
                text: Text(
                  "Đăng Nhập",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold),
                ),
                color: AppColors.primary,
                padding: const EdgeInsets.all(10),
                onPressed: () async => {
                  await ref.read(authController.notifier).login(
                        email: "khoile0908540@gmail.com",
                        password: "Khoile35_2004",
                      )
                },
              ),

              // Not a member? Register now

              const CustomSizedBox(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có tài khoản?",
                    style: TextStyle(
                        color: Colors.black, fontSize: screenWidth * 0.04),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text(
                      "Tạo tài khoản",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),

              // or
              const CustomSizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Hoặc",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),

              const CustomSizedBox(),

              MyButton(
                text: Text(
                  "Tiếp tục với Google",
                  style: TextStyle(
                      color: Colors.black, fontSize: screenWidth * 0.04),
                ),
                borderColor: Colors.black,
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                icon: SvgPicture.asset(
                  'assets/logo/google_icon.svg',
                  height: screenWidth * 0.06,
                  width: screenWidth * 0.06,
                ),
                onPressed: () async => {
                  await ref.watch(authController.notifier).continueWithGoogle(),
                },
              ),

              const CustomSizedBox(),

              // MyButton(
              //   text: Text(
              //     "Tiếp tục với Facebook",
              //     style: TextStyle(
              //         color: Colors.black, fontSize: screenWidth * 0.04),
              //   ),
              //   borderColor: Colors.black,
              //   color: Colors.white,
              //   padding: const EdgeInsets.all(12),
              //   icon: SvgPicture.asset(
              //     'assets/logo/facebook_icon.svg',
              //     height: screenWidth * 0.06,
              //     width: screenWidth * 0.06,
              //   ),
              //   onPressed: () {},
              // ),
            ],
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
    return SizedBox(height: MediaQuery.of(context).size.width * 0.025);
  }
}
