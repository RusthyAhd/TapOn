import 'package:flutter/material.dart';

class TapOnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TapOn"),
        backgroundColor: Colors.yellow[700],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Choose your service",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "You can always change this later.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ServiceIcon(title: "plumbing", icon: Icons.plumbing),
                    ServiceIcon(title: "electrical", icon: Icons.electrical_services),
                    ServiceIcon(title: "carpentry", icon: Icons.handyman),
                    ServiceIcon(title: "painting", icon: Icons.format_paint),
                    ServiceIcon(title: "gardening", icon: Icons.grass),
                    ServiceIcon(title: "appliance", icon: Icons.kitchen),
                    
                    ServiceIcon(title: "phone repair", icon: Icons.phone_iphone),
                    ServiceIcon(title: "Saloon", icon: Icons.face),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: const Text("BACK")),
                    TextButton(onPressed: () {}, child: const Text("NEXT")),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://www.example.com/plumber_image.jpg",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Supply'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceIcon({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.grey[700]),
        const SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
} 

