import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/Tool_Provider/TP_AcceptedOrderHistory.dart';
import 'package:tap_on/Tool_Provider/TP_AddTool.dart';
import 'package:tap_on/Tool_Provider/TP_Feedback.dart';
import 'package:tap_on/Tool_Provider/TP_History.dart';
import 'package:tap_on/Tool_Provider/TP_Notification.dart';
import 'package:tap_on/Tool_Provider/TP_Profile.dart';
import 'package:tap_on/Tool_Provider/TP_ToolManager.dart';

class TP_Dashboard extends StatelessWidget {
  const TP_Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'TapOn ShopOwner',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Incoming Orders',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with logo and shop name
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[700],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    backgroundImage:
                        AssetImage('profile.png'), // Add your image here
                  ),
                  SizedBox(height: 16),
                  Text(
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
              leading: Icon(Icons.list_alt),
              title: Text('Order History'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TP_History()));
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
                            TP_AddTool())); // Handle Menu Manager button press
              },
            ),

            // Performance button
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Menu Manager'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TP_ToolManager()));
                // Handle Performance button press
              },
            ),

            // Notifications button
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TP_Notfication()));

                // Handle Notifications button press
              },
            ),

            // Shop Profile button
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Shop Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TP_Profile()));
                // Handle Shop Profile button press
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TP_Feedback()));
                // Handle Shop Profile button press
              },
            ),

            const SizedBox(
              height: 25,
            ),
            // Log Out button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));

                // Handle Log Out button press
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 8, 0, 0),
                backgroundColor: const Color.fromARGB(255, 219, 135, 9),
                minimumSize: Size(70, 50),
              ),
              child: Text('Log Out'),
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
                    subStatus: '2ND ORDER',
                    orderId: '162267901',
                    date: '12 Sept 2024, 9:31 am',
                    itemCount: 4,
                    itemname: 'Hammer',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TP_AcceptedHistory()), // Navigate to accepted orders page
          );
        },
        backgroundColor:
            const Color.fromARGB(255, 255, 214, 7), // Color of the button
        child: const Text(
          'Accepted',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }

  orderItem(
      {required String subStatus,
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
                  'Status: ($subStatus)',
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "Accept" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Button color
                      ),
                      child: const Text('Accept'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "Reject" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                      ),
                      child: const Text('Reject'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
