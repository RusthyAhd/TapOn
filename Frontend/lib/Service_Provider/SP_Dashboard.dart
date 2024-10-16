import 'package:flutter/material.dart';

import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/Service_Provider/SP_AcceptedOrders.dart';
import 'package:tap_on/Service_Provider/SP_Addservice.dart';
import 'package:tap_on/Service_Provider/SP_Feedback.dart';
import 'package:tap_on/Service_Provider/SP_History.dart';
import 'package:tap_on/Service_Provider/SP_Notification.dart';
import 'package:tap_on/Service_Provider/SP_Profile.dart';
import 'package:tap_on/Service_Provider/SP_Servicemanager.dart';



class SP_Dashboard extends StatelessWidget {
  const SP_Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'TapOn Provider',
              style: TextStyle(
                fontSize: 20, // You can adjust the size
                fontWeight: FontWeight.bold, // Optional: Makes the text bold
              ),
            ),
            Text(
              'Incoming Orders',
              style: TextStyle(
                fontSize: 16, // You can adjust the size
                fontWeight: FontWeight.normal, // Optional: Normal text weight
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SP_History()));
                // Handle Orders button press
              },
            ),

            // Menu Manager button
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Service'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SP_Addservice())); // Handle Menu Manager button press
              },
            ),

            // Performance button
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Service Manager'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SP_Servicemanager()));
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
                        builder: (context) => SP_Notification()));

                // Handle Notifications button press
              },
            ),

            // Shop Profile button
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Provider Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SP_Profile()));
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
                        builder: (context) => SP_Feedback()));
                // Handle Shop Profile button press
              },
            ),

            const SizedBox(
              height: 25,
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellow,
                  minimumSize: Size(70, 50),
                ),
                child: Text('Log Out'),
              ),
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
                      context: context,
                      subStatus: '2ND ORDER',
                      orderId: '162267901',
                      date: '12 Sept 2024, 9:31 am',
                      ordername: 'Santize full home',
                      statusColor: Colors.brown,
                      customername: 'Rishaf',
                      customermobile: '0755354023',
                      customerLocation: 'No-2,Kinniya'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  orderItem(
                      context: context,
                      subStatus: '2ND ORDER',
                      orderId: '162267901',
                      date: '12 Sept 2024, 9:31 am',
                      ordername: 'Santize full home',
                      statusColor: Colors.brown,
                      customername: 'Rishaf',
                      customermobile: '0755354023',
                      customerLocation: 'No-2,Kinniya'),
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
                    SP_AcceptedOrder()), // Navigate to accepted orders page
          );
        },
        backgroundColor:
            const Color.fromARGB(255, 255, 214, 7), // Color of the button
        child: const Text(
          'Accept',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget orderItem({
    required BuildContext context,
    required String subStatus,
    required String orderId,
    required String date,
    required String customername,
    required String customermobile,
    required String customerLocation,
    required String ordername,
    required MaterialColor statusColor,
  }) {
    return Card(
      color: const Color.fromARGB(255, 233, 231, 207),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: $orderId',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Order: $ordername ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 8),
            Text('Date: $date'),
            Text('Customer Name: $customername'),
            Text('Customer Location: $customerLocation'),
            Text('Customer Mobile: $customermobile'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SP_AcceptedOrder(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 197, 39),
                          foregroundColor: Colors.black // Button color
                          ),
                      child: const Text('Accept'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black // Button color
                          ),// Handle the "Reject" button press

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
