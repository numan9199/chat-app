// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:app/chat/body.dart';
import 'package:app/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/setting_screen.dart';

class chatroom extends StatefulWidget {
  const chatroom({super.key});

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  int _selectedIndex = 0;
  final screen = [
    const body(),
    const ContactScreen(),
    const SettingScreen(),
  ];
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
                backgroundImage: AssetImage(
                  "assets/images/user_2.png", //get from user
                ),
              ))
        ]);
  }
}
