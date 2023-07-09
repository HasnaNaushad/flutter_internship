import 'package:flutter/material.dart';

import 'package:flutter_internship/SplashScreen.dart';
import 'package:flutter_internship/AccountPage.dart';
import 'package:flutter_internship/Albumpage.dart';
import 'package:flutter_internship/ArtistPage.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/homescreen.dart';
import 'package:flutter_internship/login.dart';
import 'package:flutter_internship/PlaylistPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HARMONIX',
      theme: ThemeData(
        primaryColor:  const Color(0xFFDFC0A3),
        primarySwatch: mprimary,
        buttonTheme: const ButtonThemeData(
         // buttonColor: Color(0xFFDFC0A3),
        ),

      ),
      home: SplashScreen(),

    );
  }
}