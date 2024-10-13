import 'package:flutter/material.dart';
import 'package:tap_on/user-services/preBooking.dart';
import 'package:tap_on/user-services/waiting%20page.dart';

class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Service Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service provider info
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/rishaf.jpg'),
                ),
                SizedBox(width: 10),
                Text('Rishaf', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),

            // Service name and description
            Text('Plumbing',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/service_image.png',
                    height: 50, width: 50),
                SizedBox(height: 10),
                Text(
                  'Plumber with years of experience. Handles leaks and renovations efficiently.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 15),

            // Reviews
            Text('Reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: [
                ReviewCard(),
                SizedBox(height: 8),
                ReviewCard(),
              ],
            ),
            Spacer(),

            // Action buttons
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WaitingPage()),
                    );
                  },
                  child: Text('Book Service'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PreBookServicePage()),
                    );
                  },
                  child: Text('Pre Booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone, color: Colors.black),
                        label:
                            Text('Call', style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.message, color: Colors.black),
                        label: Text('Message',
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          side: BorderSide(color: Colors.black),
                        ),
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

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/guy_hawkins.jpg'),
        ),
        title: Text('Guy Hawkins', style: TextStyle(fontSize: 14)),
        subtitle: Text('Great service!'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 14),
            Text('4.9', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
