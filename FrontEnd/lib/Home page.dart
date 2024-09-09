import 'package:flutter/material.dart';
import 'package:tap_on/Notification.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TapOn rishaf'),
        backgroundColor: Colors.amber[700],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () { 
               Navigator.push(context, MaterialPageRoute(builder:(context) => NotificationPage()));
                      // Add your onPressed logic here
              // Notification action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with profile image
            ),
            title: Text('Rishaf'),
            trailing: Icon(Icons.settings),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose your service',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCard(icon: Icons.plumbing, label: 'Plumber'),
                ServiceCard(icon: Icons.electrical_services, label: 'Electrician'),
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Featured Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 180,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/plumber_featured.jpg'), // Replace with your featured image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop Owner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'Service Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[700],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceCard({required this.icon, required this.label});

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
            SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}