import 'package:flutter/material.dart';

class AcceptedOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Accepted'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking ID', style: TextStyle(color: Colors.grey)),
                Text('162267901', style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            Text('Sanitize full home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Date:', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Text('September 15, 2024'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Time:', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                Text('12:00 PM'),
              ],
            ),
            SizedBox(height: 25),

            // Customer Details
            Text("About Customer",style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
           Container(
  padding: EdgeInsets.all(10),  // Optional padding around the Container
  decoration: BoxDecoration(
    color: Colors.grey[200],  // Background color of the container
    borderRadius: BorderRadius.circular(10),
  ), 
  child: Column(
            children: [
              ListTile(
              title: Text('Customer Details'),
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
                children: [
                  Text('david1@gmail.com'),
                  Text('mok', style: TextStyle(color: Colors.grey)),
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
                  _buildPriceRow('Price', '\$26.00 * 1 = \$26.00'),
                  Divider(),
                  _buildPriceRow('Sub Total', '\$26.00'),
                  Divider(),
                  _buildPriceRow('Total Amount', '\$26.00', isBold: true),
                ],
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

