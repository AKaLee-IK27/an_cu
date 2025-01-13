import 'package:an_cu/Views/ChatBot/constants/constants.dart';
import 'package:an_cu/Views/ChatBot/hive/chat_history.dart';
import 'package:an_cu/Views/ChatBot/hive/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(Constants.chatHistoryBox);

  static Box<UserModel> getUser() => Hive.box<UserModel>(Constants.userBox);
}
