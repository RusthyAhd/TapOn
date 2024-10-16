import 'package:flutter/material.dart';
import 'package:tap_on/Tool_Provider/TP_Dashboard.dart';


class TP_Notfication extends StatelessWidget {
  const TP_Notfication({super.key});

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
                  MaterialPageRoute(builder: (context) => TP_Dashboard()));
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            NotificationTile(
              title: "Meeting reminder",
              subtitle: "TYou have prebooking order today at 2:00 PM",
            ),
            NotificationTile(
              title: "You have feedback",
              subtitle: "Your equipments are good",
            ),
            NotificationTile(
              title: "Your item confirmed",
              subtitle: "Track order status",
            ),
            NotificationTile(
              title: "Up to 50% off",
              subtitle: "Track order status",
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
