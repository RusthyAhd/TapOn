import 'package:flutter/material.dart';
import 'package:tap_on/AddTools.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/ShopNotfication.dart';
import 'package:tap_on/ShopProfile.dart';
import 'package:tap_on/history.dart';
import 'package:tap_on/menumanager.dart';

class AddToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TapOn',
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
        backgroundColor: Colors.teal,
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with logo and shop name
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/tea_time_logo.png'), // Add your image here
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tea Time (Homagama)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Orders button
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('History'),
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
              leading: Icon(Icons.menu_book),
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
              leading: Icon(Icons.show_chart),
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
        child: Text('Tea Time Dashboard'),
      ),
    );
  }
}
