import 'package:an_cu/Controllers/auth_controller.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Authentication/Widgets/my_button.dart';
import 'package:an_cu/Views/Authentication/Widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
  bool isPressButtonSignUp = false;

  final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', );

  void signUp(WidgetRef ref, BuildContext context) {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || passwordCheckController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hãy nhập đầy đủ thông tin!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (!emailRegex.hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email không hợp lệ!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (passwordController.text != passwordCheckController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu nhập lại không trùng khớp!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      isPressButtonSignUp = true;
      ref.read(authController.notifier).signup(
        email: emailController.text,
        password: passwordController.text,
        displayName: nameController.text,
      );
    }
  }

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authController.notifier).continueWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    screenWidth =
        (screenWidth < (screenHeight / 2)) ? screenWidth : screenHeight / 2;
    final localStore = ref.read(localStoreProvider);

    ref.listen(authController, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) async {
          if (!isPressButtonSignUp) {
            localStore.setBool('isLoggedIn', true);
          } else {
            await user.updateDisplayName(nameController.text);
            await user.reload();
          }
          router.goInit();
          // Alert
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign Up Success'),
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
    });

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
                    "Đăng Ký",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.06,
                      color: Colors.black,
                    ),
                  ),

                  const CustomSizedBox(),

                  MyTextfield(
                    controller: nameController,
                    labelText: "Họ tên",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),

                  const CustomSizedBox(),

                  MyTextfield(
                    controller: emailController,
                    labelText: "Địa chỉ Email",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                    ),
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
                        fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: const Icon(Icons.key),
                      obscureText: true),

                  //sign in button

                  const CustomSizedBox(),

                  MyTextfield(
                      controller: passwordCheckController,
                      labelText: "Nhập lại mật khẩu",
                      textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: const Icon(Icons.key),
                      obscureText: true),
              
                  //sign in button
              
                  const CustomSizedBox(),
              
                  MyButton(
                    text: Text(
                      "Đăng Ký",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    color: AppColors.primary,
                    padding: EdgeInsets.all(screenWidth * 0.035),
                    loading: ref
                      .watch(authController)
                      .maybeWhen(orElse: () => false, loading:() => true),
                    onPressed: () => {
                      signUp(ref, context)
                    },
                  ),

                  // Not a member? Register now

                  const CustomSizedBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đã có tài khoản?",
                        style: TextStyle(
                            color: Colors.black, fontSize: screenWidth * 0.04),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => {router.goSignIn()},
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: screenWidth * 0.04),
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

                  // google + facebook sign in buttons

                  const CustomSizedBox(),

                  MyButton(
                    text: Text(
                      "Tiếp tục với Google",
                      style: TextStyle(
                          color: Colors.black, fontSize: screenWidth * 0.04),
                    ),
                    borderColor: Colors.black,
                    color: Colors.white,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    icon: SvgPicture.asset(
                      'assets/logo/google_icon.svg',
                      height: screenWidth * 0.06,
                      width: screenWidth * 0.06,
                    ),
                    onPressed: () => {signInWithGoogle(ref)},
                  ),

                  const CustomSizedBox(),

                  MyButton(
                    text: Text(
                      "Tiếp tục với Facebook",
                      style: TextStyle(
                          color: Colors.black, fontSize: screenWidth * 0.04),
                    ),
                    borderColor: Colors.black,
                    color: Colors.white,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    icon: SvgPicture.asset(
                      'assets/logo/facebook_icon.svg',
                      height: screenWidth * 0.06,
                      width: screenWidth * 0.06,
                    ),
                    onPressed: () {},
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
    return SizedBox(height: MediaQuery.of(context).size.height * 0.01);
  }
}
