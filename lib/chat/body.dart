import 'package:app/infosample/Chat.dart';
import 'package:app/chat/chatcard.dart';
import 'package:app/message/messageScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Container(
              margin: const EdgeInsets.only(top: 0, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: const Text(
                      'Messages',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    margin: const EdgeInsets.only(left: 150, top: 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                ],
              ))),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: chatsData.length,

                      ///user message screen
                      itemBuilder: (context, index) => chatcard(
                            chat: chatsData[index],
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const messageScreen()));
                            },
                          )))
            ],
          )),
    ]);
  }
}
