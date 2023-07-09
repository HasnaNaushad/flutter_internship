import 'package:flutter/material.dart';

const MaterialColor mprimary = MaterialColor(_mprimaryPrimaryValue, <int, Color>{
 50: Color(0xFFEAE8EF),
 100: Color(0xFFCBC5D7),
 200: Color(0xFFA99FBD),
 300: Color(0xFF8678A3),
 400: Color(0xFF6C5B8F),
 500: Color(_mprimaryPrimaryValue),
 600: Color(0xFF4B3873),
 700: Color(0xFF413068),
 800: Color(0xFF38285E),
 900: Color(0xFF281B4B),
});
const int _mprimaryPrimaryValue = 0xFF523E7B;

const MaterialColor mprimaryAccent = MaterialColor(_mprimaryAccentValue, <int, Color>{
 100: Color(0xFFA88BFF),
 200: Color(_mprimaryAccentValue),
 400: Color(0xFF5C25FF),
 700: Color(0xFF490CFF),
});
const int _mprimaryAccentValue = 0xFF8258FF;