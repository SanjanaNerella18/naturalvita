import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:naturalvita/login_screen.dart'; // Ensure the LoginScreen import

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Green background
      body: Stack(
        children: [
          // Centered Circular Logo
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/logos/logo1.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red, size: 50); // Debugging
                  },
                ),
              ),
            ),
          ),

          // Version text at the bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
