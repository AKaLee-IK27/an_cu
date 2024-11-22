import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/SharedReferences/local_store.provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    screenWidth = (screenWidth < (screenHeight / 2)) ? screenWidth : screenHeight / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )
                ],
              );
            }),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () =>
                        pageController.jumpToPage(controller.items.length - 1),
                    child: Text(
                      "Bỏ qua",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeInOut),
                    effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: AppColors.primary),
                  ),
                  TextButton(
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                    child: Text(
                      "Tiếp Tục",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget getStarted() {
    final router = ref.watch(goRouterProvider);
    final localStore = ref.read(localStoreProvider);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.primary),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
        onPressed: () async {
          if (!mounted) return;

          await localStore.setBool('isStarted', true);
          router.goInit();
        },
        child: const Text(
          "Bắt Đầu Khám Phá",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OnboardingInfo {
  final String title;
  final String description;
  final String image;

  OnboardingInfo(
      {required this.title, required this.description, required this.image});
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Chào Mừng Tới An Cư Connect",
        description:
            "Khám phá ngôi nhà mơ ước của bạn hoặc bán tài sản của bạn một cách dễ dàng. Hãy bắt đầu cuộc hành trình bất động sản của bạn.",
        image: "assets/images/onboarding_1.png"),
    OnboardingInfo(
        title: "Khám Phá Bất Động Sản",
        description:
            "Khám phá hàng ngàn bất động sản. Lọc theo vị trí, giá cả,... để tìm kết quả phù hợp nhất.",
        image: "assets/images/onboarding_2.png"),
    OnboardingInfo(
        title: "Hãy Bắt Đầu Khám Phá!",
        description:
            "Đăng ký ngay bây giờ và thực hiện bước đầu tiên để tìm ngôi nhà mới hoặc bán tài sản của bạn.",
        image: "assets/images/onboarding_3.png")
  ];
}
