import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:an_cu/Utils/CommonWidget/custom_sized_box.dart';

final isDisplayNameEnableProvider =
    StateNotifierProvider<IsDisplayNameEnableNotifier, bool>((ref) {
  return IsDisplayNameEnableNotifier();
});

class IsDisplayNameEnableNotifier extends StateNotifier<bool> {
  IsDisplayNameEnableNotifier() : super(false);
  void toggle() {
    state = !state;
  }
}

User? currentUser = FirebaseAuth.instance.currentUser;

class AccountScreen extends ConsumerWidget {
  AccountScreen({super.key});

  final emailController = TextEditingController();
  final displayNameController = TextEditingController();

  String displayName = currentUser?.displayName ?? '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String isVerified = (!currentUser!.emailVerified) ? "Chưa được xác minh" : "Đã xác minh";
    bool isDisplayNameEnable = ref.watch(isDisplayNameEnableProvider);

    emailController.text = '${currentUser?.email}';
    displayNameController.text = displayName;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const MyBackButton(color: AppColors.secondary),
          title: const Text('Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.2,
                  width: screenHeight * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/demo_avatar.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          
                const CustomSizedBox(),
          
                Text(
                  "Hello, $displayName",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.06,
                      color: AppColors.primary),
                ),

                const CustomSizedBox(),

                TextField(
                  controller: displayNameController,
                  obscureText: false,
                  enabled: isDisplayNameEnable,
                  decoration: InputDecoration(
                    labelText: "Họ Tên",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),

                const CustomSizedBox(percentageScreenHeight: 0.02,),
          
                TextField(
                  controller: emailController,
                  obscureText: false,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: const Icon(Icons.mail_outline_rounded),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),

                const CustomSizedBox(percentageScreenHeight: 0.02,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Xác minh Email: ",
                      style: TextStyle(color: AppColors.primary, fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      isVerified,
                      style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),

                const CustomSizedBox(percentageScreenHeight: 0.02,),

                isDisplayNameEnable ? buttonSave(ref) : buttonChange(ref),
              ],
            ),
          ),
        ),
      ),
    ); // Hello world
  }
  
  Widget buttonChange(WidgetRef ref) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        label: const Text("Chỉnh sửa",style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16),),
        onPressed: () {
          ref.read(isDisplayNameEnableProvider.notifier).toggle();
        },
      ),
    );
  }

  Widget buttonSave(WidgetRef ref) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        label: const Text("Lưu",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        onPressed: () async {
          await currentUser?.updateDisplayName(displayNameController.text);
          await currentUser?.reload();
          displayName = displayNameController.text;
          ref.read(isDisplayNameEnableProvider.notifier).toggle();
        },
      ),
    );
  }
}