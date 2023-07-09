import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String version = '1.0.0'; // Replace with your actual version number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),

    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Color(0xFF523E7B), // Dark purple color
    Color(0xFF9C89B8), // Light purple color
    ],
    stops: [0.0, 0.8], // Adjust the stops to control the transition point
    ),
    ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application Version',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Version: $version',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Other Details',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Some other information about the application.',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      )  ),
    );
  }
}
