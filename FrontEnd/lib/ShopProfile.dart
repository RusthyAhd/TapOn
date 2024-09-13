import 'package:flutter/material.dart';




class ShopProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Profile'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open drawer or menu action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/tea_time_logo.png'), // Add your logo here
              ),
              SizedBox(height: 10),
              Text(
                'Tea Time (Homagama)',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Institute of Technology University of Moratuwa, \nHomagama-Diyagama Rd',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              buildInfoSection('Account'),
              buildDetailTile('Email', 'teatime.ho@merchant.lk'),
              SizedBox(height: 20),
              buildInfoSection('Merchant'),
              buildDetailTile('Shop ID', '50010'),
              buildDetailTile('Shop Name', 'Tea Time (Homagama)'),
              buildDetailTile('Shop Address', 
                  'Institute of Technology University of Moratuwa, \nHomagama-Diyagama Rd'),
              buildDetailTile('Work Hours', 'Mon | Tue | Wed | Thu | Fri | Sat | Sun'),
              buildDetailTile('Phone Number', '0740710280'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action for button press
                },
                child: Text('Calls and notifications will vibrate'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildDetailTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Action on tapping the tile
      },
    );
  }
}
