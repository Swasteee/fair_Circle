import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreedToTerms = true;

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EFE5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupPage()),
                    );
                  },
                ),
                Text("Back", style: TextStyle(color: Colors.brown)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Create an\nAccount',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Image.asset(
              "/Users/swastee/Desktop/MobileApplication/Flutter/faircircle/assets/icons/logo.png",
              height: 140,
            ),
            SizedBox(height: 20),
            buildField("Username", usernameController),
            buildField("Email Adress", emailController),
            buildField("Password", passwordController, isPassword: true),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(
                  "I agree to the terms and conditions",
                  style: TextStyle(color: Colors.brown),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 235, 174, 152),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
              ),
              child: Text("SIGN UP", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.brown.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
