import 'package:flutter/material.dart';
import 'package:tap_on/Service_Provider/SP_Dashboard.dart';

class SP_Notification extends StatelessWidget {
  const SP_Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: const Text("Notification Page"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SP_Dashboard()));
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            NotificationTile(
              title: "New booking recieved",
              subtitle: "Newbooking 123456 - Rishaf has booked  fiter replacement",
            ),
            NotificationTile(
              title: "Booking update",
              subtitle: "Your service cancelled",
            ),
            NotificationTile(
              title: "Your Service Added Succesfully",
              subtitle: "Track service status",
            ),
            NotificationTile(
              title: "Up to 50% off booking recieved",
              subtitle: "New booking Incoming",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotificationTile(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
