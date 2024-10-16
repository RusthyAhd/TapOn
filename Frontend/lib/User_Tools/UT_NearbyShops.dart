import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tap_on/User_Tools/UT_Location.dart';
import 'package:tap_on/User_Tools/UT_ToolMenu.dart';


class UT_NearbyShops extends StatelessWidget {
  final List<Map<String, dynamic>> serviceProviders = [
    {
       'name': 'Iorn Hardware',
      'district': 'Trincomalee',
      'distance': '1.5km',
      'rating': 4.9,
      'service': 'General',
      'delivery fee': "Rs.300.00",
      'amount per hour': 'Rs.1000.00',
      'image': 'assets/mohammed.jpg',
    },
    {
       'name': 'Iorn Hardware',
      'district': 'Trincomalee',
      'distance': '1.5km',
      'rating': 4.9,
      'service': 'General',
      'delivery fee': "free",
      'amount per hour': 'Rs.1000.00',
      'image': 'assets/mohammed.jpg',
    },
    {
       'name': 'Hamthy Hardware',
      'district': 'Trincomalee',
      'distance': '1.5km',
      'rating': 4.9,
      'service': 'General',
      'delivery fee': "Rs.300.00",
      'amount per hour': 'Rs.1000.00',
      'image': 'assets/mohammed.jpg',
    },
  ];

  UT_NearbyShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Applying a Gradient Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.yellow[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // AppBar with Custom Styling
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.arrow_back, color: Colors.black, size: 30),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UT_Location()));
                      },
                    ),
                    const Text(
                      'Nearby Tool Shops',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                        width:
                            30), // Placeholder to balance the title alignment
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            // Map Placeholder with Glassmorphism Effect
            Container(
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
                border:
                    Border.all(color: Colors.white.withOpacity(0.4), width: 1),
              ),
              child: const Center(
                child: Text(
                  'Map View Placeholder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // List of Service Providers with Enhanced Design
            Expanded(
              child: ListView.builder(
                itemCount: serviceProviders.length,
                itemBuilder: (context, index) {
                  final provider = serviceProviders[index];

                  return GestureDetector(
                    child: Card(
                      elevation: 10,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey[200]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Provider Image with Circular Design
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(provider['image']),
                            ),
                            SizedBox(width: 16),
                            // Provider Info
                         
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(provider['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                            text: 'Delivery Fee: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['delivery fee'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                         RichText(
                          text: TextSpan(
                            text: 'Amount Per Hour: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black,),
                            children: [TextSpan(text: provider['amount per hour'],style: TextStyle( fontSize: 16,fontWeight: FontWeight.normal,color:const Color.fromARGB(255, 3, 112, 207),),),],
                          ),
                        ),
                        Text('Rating: ${provider['rating'].toString()}',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),




                            // "Choose" Button with Ripple Effect
                            ElevatedButton(
                              onPressed: () {
                                // Pass the shop's name and relevant products
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UT_ToolMenu(
                                      shopName: provider['name'],
                                      products: const [
                                        {
                                          'title': 'Hammer (New)',
                                          'price': 'Rs 1,000',
                                          'image': 'assets/images/hammer.jpg',
                                          'description':
                                              'This is a high-quality new hammer made for heavy-duty usage.',
                                        },
                                        {
                                          'title': 'Pliers (Used)',
                                          'price': 'Rs 300',
                                          'image': 'assets/images/pliers.jpg',
                                          'description':
                                              'Used pliers in good condition. Suitable for small repairs.',
                                        },
                                        {
                                          'title': 'Screwdrivers (New)',
                                          'price': 'Rs 900',
                                          'image':
                                              'assets/images/Screwdrivers.jpg',
                                          'description':
                                              'This is a high-quality new hammer made for heavy-duty usage.',
                                        },
                                        {
                                          'title': 'Wire Stripper (Used)',
                                          'price': 'Rs 500',
                                          'image':
                                              'assets/images/Wire Stripper.jpeg',
                                          'description':
                                              'This is a high-quality new hammer made for heavy-duty usage.',
                                        },
                                        {
                                          'title':
                                              'Flame Retardant Shirt (New)',
                                          'price': 'Rs 680',
                                          'image':
                                              'assets/images/Flame Retardant Shirt.jpg',
                                          'description':
                                              'This is a high-quality new hammer made for heavy-duty usage.',
                                        },
                                        // Add more products for the shop here...
                                      ],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                                elevation: 5,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Choose',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
