import 'package:flutter/material.dart';
import 'package:tap_on/Users/User%20product%20details.dart';
import 'package:tap_on/Users/Tool%20location.dart';

class NearbyToolRantPage extends StatelessWidget {
  final List<Map<String, dynamic>> serviceProviders = [
    {
      'name': 'hamthy hardware',
      'address': '4140 Parker Rd, Allentown, New Mexico 31134',
      'rating': 4.9,
      'service': 'General',
      'image': 'assets/mohammed.jpg',
    },
    {
      'name': 'omega store',
      'address': 'Electrical Services',
      'rating': 4.9,
      'service': 'Electrical',
      'image': 'assets/annette.jpg',
    },
    {
      'name': 'Guy Hawkins',
      'address': 'Plumbing Services',
      'rating': 4.5,
      'service': 'Plumbing',
      'image': 'assets/guy.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Nearby Tool Shop', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TLocationPage()));
          },
        ),
      ),
      body: Column(
        children: [
          // Map Placeholder
          Container(
            height: 250,
            color: Colors.white,
            child: Center(
              child: Text(
                'Map Placeholder',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          // List of Service Providers
          Expanded(
            child: ListView.builder(
              itemCount: serviceProviders.length,
              itemBuilder: (context, index) {
                final provider = serviceProviders[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(provider['image']),
                    ),
                    title: Text(provider['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider['address']),
                        Text('Rating: ${provider['rating'].toString()}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Toolmenu()));
                        // Action when the button is pressed
                      },
                      child: Text('Choose'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
