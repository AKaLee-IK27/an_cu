import 'package:an_cu/Views/ChatBot/providers/chat_provider.dart';
import 'package:an_cu/app.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import 'firebase_options.dart';

Future<void> main() async {
  CloudinaryContext.cloudinary =
      Cloudinary.fromCloudName(cloudName: 'db7lwrzjz');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ChatProvider.initHive();

  runApp(ProviderScope(
      child: provider.MultiProvider(providers: [
    provider.ChangeNotifierProvider(
      create: (context) => ChatProvider(),
    ),
  ], child: const MainApp())));
}
