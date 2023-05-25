import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flash_chat/components/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flash_chat/constants.dart';

import '../components/models.dart';

class GptService{
  static Future<List<Model>> getModels() async{
    try{
      var response = await http.get(Uri.parse("$baseUrl/models"),
      headers: {'Authorization': 'Bearer $openAiKey'}
      );
      var jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error'] != null){
        print("jsonResponse['error'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      List temp = [];
      for(var value in jsonResponse["data"]){
        temp.add(value);
        print("temp ${value["id"]}");
      }
      return Model.modelsFromSnapshot(temp);
    }catch(error){
      print("error $error");
      rethrow;
    }
  }

  //send msg
  static Future<List<ChatModel>> sendMessage(String message, String modelId) async{
    try{
      var response = await http.post(Uri.parse("$baseUrl/completions"),
          headers: {
            'Authorization': 'Bearer $openAiKey',
            'Content-Type': 'application/json'},
          body: jsonEncode({
            "model": modelId,
            "prompt": message,
            "max_tokens": 100,
            "temperature": 0
          })
      );
      Map jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error'] != null){
        print("jsonResponse['error'] ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if(jsonResponse["choices"] != null){
        chatList = List.generate(
              jsonResponse["choices"] != null ? jsonResponse["choices"].length : 0,
              (index) => ChatModel(
                  message: jsonResponse['choices'][index]['text'],
                  chatIndex: 1),
        );
      }
      return chatList;
    }catch(error){
      print("error $error");
      rethrow;
    }
  }
}