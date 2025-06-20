import 'package:faircircle/presentation/dashboard.dart';
import 'package:faircircle/presentation/login_page.dart';
import 'package:faircircle/presentation/onboarding_page.dart';
import 'package:faircircle/presentation/signup_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FairCircle',
      theme: ThemeData(fontFamily: 'Georgia'),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
