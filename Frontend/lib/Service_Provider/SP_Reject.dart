import 'package:flutter/material.dart';

class SP_Reject extends StatelessWidget {
  const SP_Reject ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber, // Matches the yellowish background in the image
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The rejected message in the center
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color around the message box
                ),
                borderRadius: BorderRadius.circular(8.0), // Rounded border corners
              ),
              child: const Text(
                'Your Booking Rejected',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(), // Pushes the button downwards

            // The button at the bottom
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // Button spans the entire width
                height: 50.0, // Set height for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Define your action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Matches the black button in the image
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Try Another Way',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

