import 'dart:async';

import 'package:flutter_internship/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Update the color to white
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/harmonix.logonew.jpg')),
                SizedBox(height: 10),
                // Add any other widgets you want to display in the splash screen
              ],
            ),
          ),
        ),
      ),
    );
  }
}
