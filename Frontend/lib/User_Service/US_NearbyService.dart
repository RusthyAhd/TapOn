//showprovider.dart
import 'package:flutter/material.dart';
import 'package:tap_on/User_Service/US_Location.dart';
import 'package:tap_on/User_Service/US_ProviderDetails.dart';

class US_NearbyService extends StatelessWidget {
  final List<Map<String, dynamic>> serviceProviders = [
    {
      'name': 'Mohammed Rishaf',
      'address': '4140 Parker Rd, Allentown, New Mexico 31134',
      'rating': 4.9,
      'service': 'General',
      'image': 'assets/mohammed.jpg',
    },
    {
      'name': 'Annette Black',
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

  US_NearbyService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => US_Location()),
            );
            // Action when the button is pressed
          },
        ),
        title: Text('Nearby Service Providers',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
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
                              builder: (context) => US_ProviderDetails()),
                        );
                        // Action when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.yellow,
                      ),
                      child: Text('Choose'),
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
