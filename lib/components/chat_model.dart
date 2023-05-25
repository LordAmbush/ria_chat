
class ChatModel{
  final String message;
  final int chatIndex;

  ChatModel({this.message,this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    message: json["msg"],
    chatIndex: json["chatIndex"],
  );
}