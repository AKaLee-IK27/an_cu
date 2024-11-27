import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Helpers/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailScreen extends ConsumerWidget {
  PostDetailScreen({super.key});

  final controller = PicturePostItems();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            transformAlignment: Alignment.topCenter,
            width: double.infinity,
            height: ScreenSize.height(context) * 0.4,
            child: Scaffold(
              body: PageView.builder(
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: ScreenSize.height(context) * 0.5,
                    child: Image.asset(
                      controller.items[index].image,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              ),
            ),
          ),
          const MyBackButton(),
          const PostContent(),
        ],
      ),
    ));
  }
}

// class BackButton extends ConsumerWidget {
//   const BackButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final router = ref.watch(goRouterProvider);

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: InkWell(
//         onTap: () {
//           router.goHome();
//         },
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           height: 36,
//           width: 36,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//           ),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: const Icon(
//               Icons.arrow_back_ios_new,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PostContent extends ConsumerWidget {
  const PostContent({super.key});

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
                const Text(
                  "CĂN HỘ URBAN GREEN RỔ HÀNG CĐT CĂN 2PN-3PN GIÁ TỐT NHẤT HIỆN NAY",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                //Address
                const Text(
                  "Urban Green, Số 6, Hiệp Bình Phước, Thủ Đức, Hồ Chí Minh",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
                const Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Mức Giá",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        Text(
                          "4,45 tỷ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Diện tích",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        Text(
                          "83 m2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                //Title Description
                const Text(
                  "Thông tin mô tả",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
                //Description
                const Text(
                  "CẬP NHẬT THÔNG TIN CĂN HỘ URBAN GREEN - ĐỐI DIỆN VẠN PHÚC CITY - GIÁ TỪ 65TR/M2 CÒN 1 THÁNG NỮA LÀ NHẬN NHÀ\nGIỎ HÀNG HIỆN TẠI:\n1. Căn 1PN SOLD OUT. ( Còn hàng bán lại)\n2. Căn 2PN - 76 - 79m2\nGiá từ 5.2 - 5.3 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~1.5 tỷ nhận nhà (ở hoặc khai thác cho thuê)\n3. Căn 2PN - 83m² như nhà mẫu\nGiá từ 4.9 - 5.6 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~1.5 -1.8 tỷ nhận nhà (ở hoặc khai thác cho thuê)\n4. Căn 3PN - 98 - 106 m2\nGiá từ 6.3 - 6.7 tỷ (Chưa vat và ưu đãi)\nThanh.toán trước ~2.4 tỷ nhận nhà (ở hoặc khai thác cho thuê).\nTÓM TẮT CHÍNH SÁCH BÁN HÀNG:\nĐối với CĂN HỘ:\nMiễn phí 2 năm Phí quản lý\nGói hỗ trợ Tiền thuê (được trừ trực tiếp vào giá bán )\n+ Căn 2PN: 150 TRIỆU\n+ Căn 4PN: 500 TRIỆU\n+ Căn 3PN: 250 TRIỆU hoặc chính sách HTLS vay trong 36 tháng (nếu KH vay)\nTặng 30.000.000 VNĐ dành cho 20 KH đầu tiên đặt cọc trong Tháng 11\nChiết khấu thanh toán nhanh:\n+ Thanh toán nhanh 20%: CK 1.5%\n+ Thanh toán nhanh 30%: CK 3%\n+ Thanh toán nhanh 50%: CK 5%\n+ Thanh toán nhanh 70%: CK 7%\n+ Thanh toán nhanh 95%: CK 9%\nKH vay vốn Ngân hàng:\n+ Hỗ trợ vay vốn đến 70%\n+ Ân hạn gốc + lãi trong 24 tháng\n+ Miễn phí tất toán trong thời gian ân hạn\n(Chi tiết cụ thể vui lòng xem Chính sách đính kèm)",
                  style: TextStyle(
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
  List<PicturePostInfo> items = [
    PicturePostInfo(image: "assets/images/post_detail.jpg"),
    PicturePostInfo(image: "assets/images/post_detail.jpg"),
    PicturePostInfo(image: "assets/images/post_detail.jpg"),
  ];
}
