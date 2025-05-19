import 'package:flutter/material.dart';
import 'view/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FairCircle',
      theme: ThemeData(fontFamily: 'Georgia', primarySwatch: Colors.brown),
      home: OnboardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
