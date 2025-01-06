import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:an_cu/Utils/CommonWidget/custom_sized_box.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

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

Future<bool> doesImageExist(String publicId) async {
  const cloudName = 'db7lwrzjz';
  final imageUrl = 'https://res.cloudinary.com/$cloudName/image/upload/$publicId';
  try {
    final response = await http.head(Uri.parse(imageUrl));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

Future<void> deleteImageFromCloudinary(String publicId) async {
  const cloudName = 'db7lwrzjz';
  const apiKey = '658649824642936';
  const apiSecret = 'O8YSsm_joeV7_LrxwgToX6ePW4I';

  final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final signature = generateSignature(publicId, timestamp, apiSecret);

  const url = 'https://api.cloudinary.com/v1_1/$cloudName/image/destroy';

  try {
    final response = await Dio().post(
      url,
      data: {
        'public_id': publicId,
        'api_key': apiKey,
        'timestamp': timestamp,
        'signature': signature,
      },
    );

    if (response.statusCode == 200) {
      print('Image delete response: ${response.data}');
    } else {
      print('Failed to delete image: ${response.data}');
    }
  } catch (e) {
    print('Error deleting image: $e');
  }
}

String generateSignature(String publicId, int timestamp, String apiSecret) {
  final data = 'public_id=$publicId&timestamp=$timestamp$apiSecret';
  return sha1.convert(utf8.encode(data)).toString();
}

final imageProvider = StateProvider<String?>((ref) => null);

class AccountScreen extends ConsumerWidget {
  AccountScreen({super.key});

  final emailController = TextEditingController();
  final displayNameController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  late String displayName = currentUser?.displayName ?? '';

  Future<void> _pickAndUploadImage(WidgetRef ref) async {
    const cloudName = 'db7lwrzjz';
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    await deleteImageFromCloudinary('ancuconnect/${currentUser?.email}');

    if (pickedFile != null) {
      try {
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(pickedFile.path),
          'upload_preset': 'o8fpswtc',
          'public_id': '${currentUser?.email}',
        });

        await Dio().post(
          'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
          data: formData,
        );

        ref.read(imageProvider.notifier).state =
          'https://res.cloudinary.com/$cloudName/image/upload/ancuconnect/${currentUser?.email}?ts=$timestamp';
      } catch (e) {
        print('Failed to upload image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(imageProvider);
    final router = ref.watch(goRouterProvider);
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
          leading: MyBackButton(color: AppColors.secondary, onTap:() {
            router.goSetting();
          },),
          title: const Text('Tài khoản'),
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
                  ),
                  child: Stack(
                    children: [
                      ClipOval(
                        child: SizedBox.expand(
                          child: imageUrl != null
                            ? AssetCheckWidget(publicId: 'ancuconnect/${currentUser?.email}')
                            : AssetCheckWidget(publicId: 'ancuconnect/${currentUser?.email}'),
                        )
                      ),
                      Positioned( 
                        bottom: 0, 
                        right: -10, 
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.all(5),
                            shape: const CircleBorder(
                              eccentricity: 0,
                              side: BorderSide.none,
                            )
                          ),
                          onPressed: () {
                            _pickAndUploadImage(ref);
                          }, 
                          label: const Icon(Icons.edit, color: Colors.white,),
                        ),
                      ),
                    ]
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

class AssetCheckWidget extends StatelessWidget{
  final String publicId;

  const AssetCheckWidget({super.key, required this.publicId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: doesImageExist(publicId), 
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const Image(
              image: AssetImage('assets/images/default_avatar.png'),
              fit: BoxFit.cover,
            );
        } else if (snapshot.hasData) {
          return CldImageWidget(
            publicId: publicId,
            fit: BoxFit.cover,
          );
        } else {
          return const Image(
            image: AssetImage('assets/images/default_avatar.png'),
            fit: BoxFit.cover,
          );
        }
      }
    );
  }
}