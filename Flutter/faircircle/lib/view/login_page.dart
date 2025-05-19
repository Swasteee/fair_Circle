
import 'package:flutter/material.dart';
import 'package:faircircle/view/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  void handleLogin() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == 'admin' && password == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      setState(() {
        errorMessage = 'Invalid credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F3EC), // light cream background
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top curved welcome section
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF8B4A2F), // dark brown
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.only(top: 60, bottom: 30),
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '← Back',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome\nBack!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Georgia',
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 16,
                      color: Colors.brown[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.brown[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Password Field
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 16,
                      color: Colors.brown[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.brown[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Login Button
                  Center(
                    child: ElevatedButton(
                      onPressed: handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8B4A2F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 80,
                        ),
                      ),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  if (errorMessage.isNotEmpty)
                    Center(
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Forgot Password Logic
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 14,
                          color: Color(0xFF8B4A2F),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Bottom curved design placeholder
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(height: 80, color: Color(0xFF8B4A2F)),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom wave clipper for bottom cloud effect
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.5);

    var secondControlPoint = Offset(size.width * 0.75, 0);
    var secondEndPoint = Offset(size.width, size.height * 0.5);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
