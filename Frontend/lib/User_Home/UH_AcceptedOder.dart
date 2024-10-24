import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';

class UH_AcceptedOrder extends StatelessWidget {
  const UH_AcceptedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Booking ID', style: TextStyle(color: Colors.grey)),
                Text('162267901', style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            Text('Sanitize full home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: const [
                Text('Date:', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Text('September 15, 2024'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: const [
                Text('Time:', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Text('12:00 PM'),
              ],
            ),
            SizedBox(height: 25),

            // Customer Details
            Text(
              "About Provider",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  EdgeInsets.all(10), // Optional padding around the Container
              decoration: BoxDecoration(
                color: Colors.blue[50], // Background color of the container
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Provider Details'),
                    trailing: TextButton(
                      onPressed: () {
                        // Implement navigation to map or directions page
                      },
                      child: Text('Get Direction'),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/customer_avatar.png'), // Replace with actual image path
                    ),
                    title: Text('Rishaf'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('david1@gmail.com'),
                        Text('Al aqsha 1st lane, colombo'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Implement chat functionality
                          },
                          icon: Icon(Icons.chat),
                          label: Text('Chat'),
                        ),
                        // Call Button
                        IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            // Implement call functionality
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Price Details
            Text('Price Detail', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildPriceRow('Consultant Fee', 'Rs.26.00 * 1 = Rs.26.00'),
                  Divider(),
                  _buildPriceRow('Amount pey day', 'Rs.26.00'),
                  Divider(),
                  _buildPriceRow('Total Amount', 'RS.26.00', isBold: true),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: (Colors.red),
                    foregroundColor: Colors.white // Full width button
                    ),
                child: Text('Reject'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String title, String price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}