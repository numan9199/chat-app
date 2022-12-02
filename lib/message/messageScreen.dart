import 'package:app/message/bodyMessage.dart';
import 'package:flutter/material.dart';

class messageScreen extends StatefulWidget {
  const messageScreen({super.key});

  @override
  State<messageScreen> createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber,
      title: Row(children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/user_2.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Nameeeeeee", style: TextStyle(fontSize: 16)),
            Text("active now", style: TextStyle(fontSize: 14))
          ],
        )
      ]),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.call))],
    ),
      body: const bodyMessage(),
    );
  }
}
