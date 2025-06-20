import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4A2F),
        title: Text('Messages', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Messages Page'),
      ),
    );
  }
}