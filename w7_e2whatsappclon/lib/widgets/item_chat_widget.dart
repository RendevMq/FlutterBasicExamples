import 'package:flutter/material.dart';
import 'package:w7_e2whatsappclon/models/chat_model.dart';
import 'package:w7_e2whatsappclon/pages/chat_details.dart';

class ItemChatWidget extends StatelessWidget {
  // const ItemChatWidget({super.key});

  ChatModel chatModel;

  ItemChatWidget({required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailPage(),
              ));
        },
        leading: CircleAvatar(
          backgroundColor: Colors.black38,
          radius: 25,
          backgroundImage: NetworkImage(chatModel.avatarUrl),
        ),
        title: Text(
          chatModel.username,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          chatModel.isTyping ? "Typing.." : chatModel.message,
          style: TextStyle(
              fontSize: 13,
              color: chatModel.isTyping ? Color(0xff01C851) : Colors.black45),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              chatModel.time,
              style: TextStyle(
                fontSize: 12,
                color: chatModel.countMessage > 0
                    ? Color(0xff01C851)
                    : Colors.black45,
              ),
            ),
            chatModel.countMessage > 0
                ? //tambien se podria usar un if else
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Color(0xff01C851),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chatModel.countMessage.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
