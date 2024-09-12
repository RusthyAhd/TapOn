import 'package:flutter/material.dart';
import 'package:tap_on/Enter%20phone%20numper%20page.dart';
import 'package:tap_on/Notification.dart';
import 'package:tap_on/chatbot';
import 'package:tap_on/edit%20profile.dart';
import 'package:tap_on/shopowner%20register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapOn'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Enternumber()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
              // Add your onPressed logic here
              // Notification action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile.jpg'), // Replace with profile image
            ),
            title: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()));
              },
              child: const Text(
                'Rishaf',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // You can customize text color
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.support_agent), // Settings icon
              onPressed: () {
                // Define your action here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChatPage()), // Replace with your screen
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Choose Your Service',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCard(icon: Icons.plumbing, label: 'Plumber'),
                ServiceCard(
                    icon: Icons.electrical_services, label: 'Electrician'),
                ServiceCard(icon: Icons.construction, label: 'Carpenter'),
                ServiceCard(icon: Icons.format_paint, label: 'Painter'),
                ServiceCard(icon: Icons.grass, label: 'Gardener'),
                ServiceCard(icon: Icons.kitchen, label: 'Fridge Repair'),
                ServiceCard(icon: Icons.build, label: 'Biling'),
                ServiceCard(icon: Icons.phone_android, label: 'Phone Repair'),
                ServiceCard(icon: Icons.content_cut, label: 'Barber'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Rent Tools',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCard(icon: Icons.plumbing, label: 'Plumbing Tools'),
                ServiceCard(
                    icon: Icons.electrical_services, label: 'Electrical Tools'),
                ServiceCard(
                    icon: Icons.construction, label: 'Carpenting Tools'),
                ServiceCard(icon: Icons.format_paint, label: 'Painting Tools'),
                ServiceCard(icon: Icons.grass, label: 'Gardening Tools'),
                ServiceCard(icon: Icons.kitchen, label: 'Repairing Tools'),
                ServiceCard(icon: Icons.build, label: 'Building Tools'),
                ServiceCard(
                    icon: Icons.phone_android, label: 'Phone Accessories'),
                ServiceCard(icon: Icons.content_cut, label: 'Mechanical Tools'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                // Handle User button press
              },
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Text('User'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopOwnerRegistration()));
                // Handle Shop Owner button press
              },
              child: Row(
                children: [
                  Icon(Icons.store),
                  SizedBox(width: 8),
                  Text('Shop Owner'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle Provider button press
              },
              child: Row(
                children: [
                  Icon(Icons.engineering),
                  SizedBox(width: 8),
                  Text('Provider'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
