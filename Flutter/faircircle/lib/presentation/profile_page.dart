import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4A2F),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
