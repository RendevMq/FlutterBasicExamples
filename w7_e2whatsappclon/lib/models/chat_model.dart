class ChatModel {
  String avatarUrl;
  String username;
  String message;
  String time;
  int countMessage;
  bool isTyping;

  ChatModel({
    required this.avatarUrl,
    required this.username,
    required this.message,
    required this.time,
    required this.countMessage,
    required this.isTyping,
  });
}
