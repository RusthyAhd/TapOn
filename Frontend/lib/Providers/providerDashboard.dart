import 'package:flutter/material.dart';
import 'package:tap_on/Providers/AddService.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/Providers/providerFeedback.dart';
import 'package:tap_on/Providers/providerNotification.dart';
import 'package:tap_on/Providers/providerOrderHistory.dart';
import 'package:tap_on/Providers/providerProfile.dart';
import 'package:tap_on/Providers/servicemanage.dart';
import 'package:tap_on/Providers/acceptedProvider.dart';
import 'package:tap_on/Providers/rejectedProvider.dart';

class Providerdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TapOn Provider',
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
                color: Colors.yellow[700],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    backgroundImage:
                        AssetImage('profile.png'), // Add your image here
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
              leading: Icon(Icons.list_alt),
              title: Text('Order History'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Providerorderhistory()));
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
                            AddServicePage())); // Handle Menu Manager button press
              },
            ),

            // Performance button
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Service Manager'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManageService()));
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
                        builder: (context) => ProviderNotificationPage()));

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
                        builder: (context) => ProviderProfilePage()));
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
                        builder: (context) => PrviderFeedbackPage()));
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
                        foregroundColor: Colors.yellow ,
                  
                  minimumSize: Size(70, 50),
                ),
                child: Text('Back to Home'),
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
    );
  }

  orderItem(
      {required BuildContext context,
      required String subStatus,
      required String orderId,
      required String date,
      required customername,
      required customermobile,
      required customerLocation,
      required String ordername,
      required MaterialColor statusColor}) {
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
                            builder: (context) => AcceptedOrderPage(),
                          ),
                        );
                      },
                      child: const Text('Accept'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 255, 197, 39), 
                            foregroundColor: Colors.black// Button color
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CancelledOrderPage(),
                          ),
                        );

                        // Handle the "Reject" button press
                      },
                      child: const Text('Reject'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black // Button color
                      ),
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
