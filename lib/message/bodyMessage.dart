import 'package:app/infosample/Chat.dart';
import 'package:app/infosample/ChatMessage.dart';
import 'package:flutter/material.dart';

class bodyMessage extends StatefulWidget {
  const bodyMessage({super.key});

  @override
  State<bodyMessage> createState() => _bodyMessageState();
}

class _bodyMessageState extends State<bodyMessage> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) => Message(
              message: demeChatMessages[index],
            ),
          ),
        )),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.amber, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'Type message',
                  ),
                ),
              ),
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: () {
                  setState(() {
                    if (_textController.text.isNotEmpty) {
                      ChatMessage input = ChatMessage();
                      input.text = _textController.text;
                      demeChatMessages.add(input);
                    }
                  });
                  _textController.clear();
                },
                child: const Icon(Icons.send),
              )
            ],
          ),
        )),
      ],
    );
  }
}

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
