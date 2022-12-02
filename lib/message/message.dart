import 'package:app/chat/chatcard.dart';
import 'package:app/infosample/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:app/message/bodyMessage.dart';

class Message extends StatelessWidget {
  Message({
    super.key,
    required this.message,
  });
  ChatMessage message;
  @override
  Widget build(BuildContext context) {
    // Widget messageContaint(ChatMessage message) {
    //   switch (message.messageType) {
    //     case ChatMessageType.text:
    //       return Textmessage(message: message);
    //     default:
    //       return SizedBox();
    //   }
    // }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: message.isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!message.isSender) ...[
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/user_3.png"),
                )
              ],
              const SizedBox(
                width: 5,
              ),
              Textmessage(message: message)
            ],
          ),
        ],
      ),
    );
  }
}

class Textmessage extends StatelessWidget {
  Textmessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.amber.withOpacity(message.isSender ? 1 : 0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        message.text,
        style: TextStyle(color: message.isSender ? Colors.white : Colors.black),
      ),
    );
  }
}