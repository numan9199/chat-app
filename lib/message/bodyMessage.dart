import 'package:app/infosample/Chat.dart';
import 'package:app/infosample/ChatMessage.dart';
import 'package:app/message/message.dart';
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
