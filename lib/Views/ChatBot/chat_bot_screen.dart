import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ikchatbot/ikchatbot.dart';

class ChatBotScreen extends ConsumerWidget {
  ChatBotScreen({super.key});

  final List<String> keywords = [
    'who are you',
    'what is flutter',
    'fuck',
    'sorry'
  ];

  final List<String> responses = [
    'I am a bot created by Iksoft Original, a proud Ghanaian',
    'Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.',
    'You are such an idiot to tell me this. you dont have future. Look for Iksoft Original and seek for knowledge. here is his number +233550138086. call him you lazy deep shit',
    'Good! i have forgiven you. dont do that again!'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatBotConfig = IkChatBotConfig(
      //SMTP Rating to your mail Settings
      ratingIconYes: const Icon(Icons.star),
      ratingIconNo: const Icon(Icons.star_border),
      ratingIconColor: Colors.black,
      ratingBackgroundColor: Colors.white,
      ratingButtonText: 'Submit Rating',
      thankyouText: 'Thanks for your rating!',
      ratingText: 'Rate your experience:',
      ratingTitle: 'Thank you for using the chatbot!',
      body: 'This is a test email sent from Flutter and Dart.',
      subject: 'Test Rating',
      recipient: 'recipient@example.com',
      isSecure: false,
      senderName: 'Your Name',
      smtpUsername: 'Your Email',
      smtpPassword: 'your password',
      smtpServer: 'stmp.gmail.com',
      smtpPort: 587,
      //Settings to your system Configurations
      sendIcon: const Icon(Icons.send, color: AppColors.secondary),
      userIcon: const Icon(Icons.person, color: AppColors.primary),
      botIcon: const Icon(Icons.android, color: AppColors.primary),
      botChatColor: const Color.fromARGB(255, 81, 80, 80),
      delayBot: 100,
      closingTime: 1,
      delayResponse: 1,
      userChatColor: Colors.blue,
      waitingTime: 1,
      keywords: keywords,
      responses: responses,
      backgroundColor: Colors.white,

      initialGreeting:
          "👋 Chào mừng đến với An Cư Connection, tôi có thể giúp gì cho bạn?",
      defaultResponse: "Sorry, I didn't understand your response.",
      inactivityMessage: "Is there anything else you need help with?",
      closingMessage: "This conversation will now close.",
      inputHint: 'Send a message',
      waitingText: 'Please wait...',
      backgroundImage: 'assets/images/search_bg.png',
      useAsset: true,
      backgroundAssetimage: 'assets/images/search_bg.png',
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(color: AppColors.secondary),
          title: const Text('Chat Bot'),
        ),
        body: ikchatbot(config: chatBotConfig),
      ),
    );
  }
}
