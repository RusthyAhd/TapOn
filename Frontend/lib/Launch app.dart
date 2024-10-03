import 'package:flutter/material.dart';
import 'package:tap_on/Enter%20Number%20Page.dart';

class TapOnApp extends StatelessWidget {
  const TapOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber[700], // background color change
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle Avatar with image
              CircleAvatar(
                radius: 180,
                backgroundColor: const Color.fromARGB(255, 252, 250, 250),
                child: Image.asset(
                  'assets/images/logo.png', // Place your logo here
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40), // Space between image and text
              const Text(
                'Discover new interests.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Empower your team with our application',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Enternumber()));

                  // Add your onPressed action here
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, color: Colors.blue)),
                child: Text('GET STARTED'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}