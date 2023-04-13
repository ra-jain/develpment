import 'package:flutter/material.dart';
import 'package:stint_app/view/common/page_heading.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [PageHeading("Chats")],
        ),
      ),
    );
  }
}
