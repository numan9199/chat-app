// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:app/chat/body.dart';
import 'package:app/connection.dart/Apiservice.dart';
import 'package:app/contact_screen.dart';
import 'package:app/model/chatroommodel.dart';
import 'package:app/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:app/setting_screen.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<Chatroom> {
  int _selectedIndex = 0;
  ApiService service = ApiService();
  late Usermodel user;
  late List<Chatroommodel> chatroom;
  List screen = [
    body(chat: chatroom, user: user),
    const ContactScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    user = await service.getUsers();
    chatroom = await service.getchatroom();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen[_selectedIndex],
        bottomNavigationBar: buildbottomnavigationbar(),
      ),
    );
  }

  BottomNavigationBar buildbottomnavigationbar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
          BottomNavigationBarItem(
              label: "profile",
              icon: CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(user.profilePicture),
              ))
        ]);
  }
}
