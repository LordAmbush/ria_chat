import 'package:flutter/foundation.dart';

import '../components/chat_model.dart';
import 'gpt_service.dart';

class GptProvider with ChangeNotifier{
  List<ChatModel> chatList = [];

  List<ChatModel> get getChatList{
    return chatList;
  }

  void addUserMsg(String msg){
    chatList.add(ChatModel(message: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> gptMessageAndAnswer(String msg, String modelId) async {
    chatList.addAll(await GptService.sendMessage(msg, modelId));
    notifyListeners();
  }
}