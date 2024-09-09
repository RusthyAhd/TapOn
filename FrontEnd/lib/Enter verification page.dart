import 'package:flutter/material.dart';
import 'package:tap_on/Enter%20phone%20numper%20page.dart';
import 'package:tap_on/Home%20page.dart';


class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC342),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter SMS Code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: '', // Removes character counter
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () { Navigator.push(context,
                   MaterialPageRoute(builder:(context) => Enternumber()));
                    // Resend code logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text('Resend Code'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {  Navigator.push(context,
                   MaterialPageRoute(builder:(context) => HomePage()));
                    // Confirm code logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text('Confirm'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'You should receive the code shortly',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}