import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Views/Home/Screens/Onboarding_Screen/Onboarding_items.dart';
import 'package:an_cu/Views/Home/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: PageView.builder(
          onPageChanged: (index) => setState(() => isLastPage = controller.Items.length-1 == index),
          itemCount: controller.Items.length,
          controller: pageController,
          itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.Items[index].image),
                const SizedBox(height: 15),
                Text(controller.Items[index].title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: AppColors.primary, fontWeight: FontWeight.bold, )),
                const SizedBox(height: 15),
                Text(controller.Items[index].description, 
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey))
              ],
            );
          }),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: isLastPage? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: ()=>pageController.jumpToPage(controller.Items.length-1), 
              child: const Text("Skip")),
        
            SmoothPageIndicator(
              controller: pageController, 
              count: controller.Items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                duration: const Duration(microseconds: 300), curve: Curves.easeInOut),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: AppColors.primary
              ),),
        
            TextButton(
              onPressed: () => pageController.nextPage(
                duration: const Duration(milliseconds: 300), curve: Curves.easeInOut), 
              child: const Text("Next"))
          ],
        ),
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
        onPressed: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onboarding", true);

          if(!mounted) return;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }, 
        child: const Text("Bắt Đầu Khám Phá",
          style: TextStyle(fontSize: 25, color: Colors.white,)
        )
      ),
    );
  }
}