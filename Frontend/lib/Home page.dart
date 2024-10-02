import 'package:flutter/material.dart';

import 'package:tap_on/Enter%20Number%20Page.dart';
import 'package:tap_on/Users/Notification.dart';
import 'package:tap_on/user-renttools/Tool%20location.dart';

import 'package:tap_on/Users/edit%20profile.dart';
import 'package:tap_on/Providers/providerRegistration.dart';

import 'package:tap_on/ShopOwner/shopowner%20register.dart';

import 'package:tap_on/user-services/location.dart';
import 'package:tap_on/Users/Chatbot.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
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
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Choose Your Service',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 233, 231, 207),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ServiceCard(
                    icon: Icons.plumbing,
                    label: 'Plumber',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.electrical_services,
                    label: 'Electrician',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.construction,
                    label: 'Carpenter',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.format_paint,
                    label: 'Painter',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.grass,
                    label: 'Gardener',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.kitchen,
                    label: 'Fridge Repair',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.build,
                    label: 'Biling',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.phone_android,
                    label: 'Phone Repair',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.content_cut,
                    label: 'beauty professional',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                ],
              ),
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
            child: Container(
              color: const Color.fromARGB(255, 233, 231, 207),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ServiceCard(
                    icon: Icons.plumbing,
                    label: 'Plumbing Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.electrical_services,
                    label: 'Electrical Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.construction,
                    label: 'Carpenting Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.format_paint,
                    label: 'Painting Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.grass,
                    label: 'Gardening Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.kitchen,
                    label: 'Repairing Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.build,
                    label: 'Building Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.phone_android,
                    label: 'Phone Accessories',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.content_cut,
                    label: 'Mechanical Tools',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TLocationPage()),
                      );
                    },
                  ),
                ],
              ),
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
              child: const Row(
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
              child: const Row(
                children: [
                  Icon(Icons.store),
                  SizedBox(width: 8),
                  Text('Shop Owner'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ServiceProviderRegistrationForm()));

                // Handle Provider button press
              },
              child: const Row(
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
  final VoidCallback onTap;

  const ServiceCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 250, 184, 78),
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
