//showprovider.dart
import 'package:flutter/material.dart';
import 'package:tap_on/User_Service/US_Location.dart';
import 'package:tap_on/User_Service/US_ProviderDetails.dart';

class US_NearbyService extends StatelessWidget {
  final List<Map<String, dynamic>> serviceProviders = [
    {
      'name': 'Mohammed Rishaf',
      'district': 'Trincomalee',
      'distance': '1.5km',
      'rating': 4.9,
      'service': 'General',
      'consultant fee': "Rs.300.00",
      'amount per day': 'Rs.1000.00',
      'image': 'assets/mohammed.jpg',
    },
    {
      'name': 'Hamthy',
      'district': 'Nuwara Eliya',
      'distance': '1.7km',
      'rating': 4.9,
      'service': 'Electrical',
      'consultant fee': "free",
      'amount per day': 'Rs.1000.00',
      'image': 'assets/annette.jpg',
    },
    {
      'name': 'Riyas',
      'district': 'Nuwara Eliya',
      'distance': '2.3km',
      'rating': 4.5,
      'service': 'Plumbing',
      'consultant fee': "Rs.300.00",
      'amount per day': 'Rs.700.00',
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
                        RichText(
                          text: TextSpan(
                            text: 'District: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['district'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Distance: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['distance'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                         RichText(
                          text: TextSpan(
                            text: 'Consultant Fee: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['consultant fee'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                         RichText(
                          text: TextSpan(
                            text: 'Amount Per Day: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['amount per day'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color:const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                        Text('Rating: ${provider['rating'].toString()}',style: TextStyle(fontWeight: FontWeight.bold)),
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
