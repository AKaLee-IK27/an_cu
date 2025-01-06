import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/CommonWidget/custom_sized_box.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SupportScreen extends ConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: MyBackButton(color: AppColors.secondary, onTap:() {
            router.goSetting();
          },),
          title: const Text('Liên hệ hỗ trợ'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [  
                SvgPicture.asset(
                  'assets/logo/main.svg',
                  width: screenWidth * 0.2,
                ),
            
                const CustomSizedBox(),
            
                Image.asset(
                  'assets/logo/brand_name.png',
                  width: screenWidth * 0.4,
                ),
            
                const CustomSizedBox(),

                Text(
                  "Ứng dụng An Cư Connect ra mắt vào tháng 12/2024, là nền tảng tư vấn mua bán bất động sản tiên tiến, tích hợp chatbot AI thông minh nhằm hỗ trợ người dùng hiệu quả và nhanh chóng trong việc tìm kiếm, mua bán và đầu tư bất động sản.",
                  style: AppTextStyles.body.merge(const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.justify,
                ),

                const CustomSizedBox(),

                Text(
                  "Mọi thắc mắc, phản hồi vui lòng liên hệ email:",
                  style: AppTextStyles.body.merge(const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.justify,
                ),
                
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: () async {
                    await Clipboard.setData( const ClipboardData(text: "admin@ancuconnect.gm.vn"));
                  }, 
                  child: Text("admin@ancuconnect.gm.vn", style: AppTextStyles.body.merge(const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),)
                ),

                const CustomSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}