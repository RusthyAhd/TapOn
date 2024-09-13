import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service provider info
            Row(
              children: [
                CircleAvatar(
                  radius: 20, // Smaller avatar size
                  backgroundImage: AssetImage('assets/rishaf.jpg'),
                ),
                SizedBox(width: 8),
                Text('Rishaf', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 12),

            // Service name and description
            Text('Service & Description', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/plumbing_service.png',
                    height: 40, width: 40),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Expert in plumbing with experience in handling leaks and renovations.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Reviews
            Text('Reviews', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 14, // Smaller avatar
                        backgroundImage: AssetImage('assets/guy_hawkins.jpg'),
                      ),
                      title:
                          Text('Guy Hawkins', style: TextStyle(fontSize: 12)),
                      subtitle: Text('Great service!',
                          style: TextStyle(fontSize: 10)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12),
                          Text('4.9', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/guy_hawkins.jpg'),
                      ),
                      title:
                          Text('Guy Hawkins', style: TextStyle(fontSize: 12)),
                      subtitle: Text('Great service!',
                          style: TextStyle(fontSize: 10)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 12),
                          Text('4.9', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),

            // Action buttons
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Book Service', style: TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Pre Booking', style: TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone, size: 16),
                        label: Text('Call', style: TextStyle(fontSize: 14)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.message, size: 16),
                        label: Text('Message', style: TextStyle(fontSize: 14)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
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
