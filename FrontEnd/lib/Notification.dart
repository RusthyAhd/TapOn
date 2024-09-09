import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: Text("Notification Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            NotificationTile(
              title: "Meeting reminder",
              subtitle: "Today at 2:00 PM",
            ),
            NotificationTile(
              title: "Your Service Accepted",
              subtitle: "Track order status",
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

  NotificationTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.black),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
