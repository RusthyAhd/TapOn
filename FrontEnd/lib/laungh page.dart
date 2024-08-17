import 'package:flutter/material.dart';
import 'package:tap_on/Enter phone numper page.dart';


class TapOnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFCC66), // Set your background color
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle Avatar with image
              CircleAvatar(
                radius: 120,
                backgroundColor: null ,
                child: Image.asset(
                  'assets/images/TapOn logo.jpeg', // Place your logo here
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40), // Space between image and text
              Text(
                'Discover new interests.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Empower your team with our application',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Enternumber()));
                  
                  // Add your onPressed action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('GET STARTED'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}