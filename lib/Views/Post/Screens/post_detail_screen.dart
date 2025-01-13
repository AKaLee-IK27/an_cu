import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Views/Authentication/Widgets/my_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostDetailScreen extends ConsumerWidget {
  final Post post;

  const PostDetailScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = post.property!.images!.isEmpty ? PicturePostItems() :  PicturePostItems.fromString(post.property?.images as List<String>);
    final pageController = PageController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Container(
            transformAlignment: Alignment.topCenter,
            width: double.infinity,
            height: ScreenSize.height(context) * 0.4,
            child: Stack(children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: PageView.builder(
                  itemCount: controller.items.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: controller.items[index].image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Image.asset('assets/images/post_detail.jpg', fit: BoxFit.cover,),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: controller.items.length > 1 ? Positioned(
                  bottom: 15.0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: controller.items.length,
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeInOut),
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: AppColors.primary),
                      ),
                    ),
                  ),
                ) : null,
              ),
            ]),
          ),
          const MyBackButton(),
          PostContent(post: post),
        ],
      ),
    ));
  }
}

class PostContent extends ConsumerWidget {
  final Post post;
  const PostContent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                //Title
                Text(
                  post.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                //Address
                Text(
                  "${post.property?.address}, ${post.property?.district}, ${post.property?.province}",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
                gapH4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Mức Giá",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.primary),
                        ),
                        Text(
                          "\$ ${post.property?.price.toString() ?? ""}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Diện tích",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.primary),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${post.property?.area} ", // Main text (e.g., 120)
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: "m", // "m" part of "m²"
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: "2", // Superscript "²"
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12, // Smaller font size
                                  color: Colors.black,
                                  fontFeatures: [FontFeature.superscripts()], // Superscript styling
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                gapH4,
                MyButton(
                    icon: const Icon(
                      Icons.phone_in_talk_rounded,
                      color: Colors.white,
                    ),
                    text: const Text("Liên Hệ: 0123456789",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    color: AppColors.primary,
                    onPressed: () {}),
                //Title Description
                gapH4,
                const Text(
                  "Thông tin mô tả",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
                //Description
                Text(
                  post.property?.description?.isNotEmpty == true ?
                  '${post.property?.description?.replaceAll(r'\n', '\n')}' :
                  "CẬP NHẬT THÔNG TIN CĂN HỘ URBAN GREEN - ĐỐI DIỆN VẠN PHÚC CITY - GIÁ TỪ 65TR/M2 CÒN 1 THÁNG NỮA LÀ NHẬN NHÀ\nGIỎ HÀNG HIỆN TẠI:\n1. Căn 1PN SOLD OUT. ( Còn hàng bán lại)\n2. Căn 2PN - 76 - 79m2\nGiá từ 5.2 - 5.3 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~1.5 tỷ nhận nhà (ở hoặc khai thác cho thuê)\n3. Căn 2PN - 83m² như nhà mẫu\nGiá từ 4.9 - 5.6 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~1.5 -1.8 tỷ nhận nhà (ở hoặc khai thác cho thuê)\n4. Căn 3PN - 98 - 106 m2\nGiá từ 6.3 - 6.7 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~2.4 tỷ nhận nhà (ở hoặc khai thác cho thuê).\nTÓM TẮT CHÍNH SÁCH BÁN HÀNG:\nĐối với CĂN HỘ:\nMiễn phí 2 năm Phí quản lý\nGói hỗ trợ Tiền thuê (được trừ trực tiếp vào giá bán )\n+ Căn 2PN: 150 TRIỆU\n+ Căn 4PN: 500 TRIỆU\n+ Căn 3PN: 250 TRIỆU hoặc chính sách HTLS vay trong 36 tháng (nếu KH vay)\nTặng 30.000.000 VNĐ dành cho 20 KH đầu tiên đặt cọc trong Tháng 11\nChiết khấu thanh toán nhanh:\n+ Thanh toán nhanh 20%: CK 1.5%\n+ Thanh toán nhanh 30%: CK 3%\n+ Thanh toán nhanh 50%: CK 5%\n+ Thanh toán nhanh 70%: CK 7%\n+ Thanh toán nhanh 95%: CK 9%\nKH vay vốn Ngân hàng:\n+ Hỗ trợ vay vốn đến 70%\n+ Ân hạn gốc + lãi trong 24 tháng\n+ Miễn phí tất toán trong thời gian ân hạn\n(Chi tiết cụ thể vui lòng xem Chính sách đính kèm)",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PicturePostInfo {
  final String image;

  PicturePostInfo({required this.image});
}

class PicturePostItems {
  List<PicturePostInfo> items = [];
  //Constructor
  PicturePostItems() {
    items = [
      PicturePostInfo(image: "assets/images/post_detail.jpg"),
      PicturePostInfo(image: "assets/images/post_detail.jpg"),
      PicturePostInfo(image: "assets/images/post_detail.jpg"),
      PicturePostInfo(image: "assets/images/post_detail.jpg"),
    ];
  }

  PicturePostItems.fromString(List<String> listImage) {
    items.clear();
    for (String image in listImage) {
      items.add(PicturePostInfo(image: image));
    }
  }
}
