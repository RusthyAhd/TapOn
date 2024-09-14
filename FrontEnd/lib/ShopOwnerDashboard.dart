import 'package:flutter/material.dart';
import 'package:tap_on/AddTools.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/ShopNotfication.dart';
import 'package:tap_on/ShopProfile.dart';
import 'package:tap_on/feedback.dart';
import 'package:tap_on/history.dart';
import 'package:tap_on/menumanager.dart';

class AddToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700], 
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TapOn ShopOwner',
              style: TextStyle(
                fontSize: 20, // You can adjust the size
                fontWeight: FontWeight.bold, // Optional: Makes the text bold
              ),
            ),
            const Text(
              'Incoming Orders',
              style: TextStyle(
                fontSize: 16, // You can adjust the size
                fontWeight: FontWeight.normal, // Optional: Normal text weight
              ),
            ),
          ],
        ),
        
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with logo and shop name
            DrawerHeader(
              decoration: BoxDecoration(
                color:  Colors.yellow[700],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    backgroundImage: AssetImage(
                        'profile.png'), // Add your image here
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Rishaf',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Orders button
            ListTile(
              leading: Icon(Icons.list_alt ),
              title: Text('Order History'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OrdersPage())); 
                // Handle Orders button press
              },
            ),

            // Menu Manager button
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Tool'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddToolPage())); // Handle Menu Manager button press
              },
            ),

            // Performance button
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Menu Manager'),
              onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>MenuScreen()
                            )); 
                // Handle Performance button press
              },
            ),



            // Notifications button
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Shopnotfication()
                            ));

                // Handle Notifications button press
              },
            ),

            // Shop Profile button
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Shop Profile'),
              onTap: () {
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>ShopProfilePage()
                            ));
                // Handle Shop Profile button press
              },
            ),
ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>ReviewsPage()
                            ));
                // Handle Shop Profile button press
              },
            ),



            // Log Out button
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Back to Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>HomePage()
                            )); 

                // Handle Log Out button press
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
              children: [
        Expanded(
          child: ListView(
            children: [
              orderItem(
                  status: 'RENTED',
                  subStatus: '2ND ORDER',
                  orderId: '162267901',
                  date: '12 Sept 2024, 9:31 am',
                  itemCount: 4,
                  itemname:'Hammer',
                  statusColor: Colors.green,
                ),
            ],
          ),
        ),
              
      const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Your orders show here'),
      ),
      
      ],
      ),
      ),
    );
  }
  
  orderItem({
    required String status, 
    required String subStatus, 
    required String orderId,
     required String date, 
     required int itemCount, 
     required String itemname, 
     required MaterialColor statusColor}) {
       return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: $orderId',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text('Item: $itemname ($itemCount pcs)'),
          Text('Date: $date'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status: $status ($subStatus)',
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ),
        ],
      ),
    ),
  );
     }
}