
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/user-renttools/Nearby_Tool_Shops.dart';

class TLocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<TLocationPage> {
  final TextEditingController _locationController = TextEditingController();
  late GoogleMapController mapController;
  bool isLoading = true; // Track if map is loading

  final LatLng _center = const LatLng(8.569, 81.234); // Default to Kinniya

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      isLoading = false; // Map is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = EdgeInsets.all(16.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Location',
          style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              color: Colors.white),
        ),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Padding(
        padding: padding,
        child: Column(
          children: <Widget>[
            // Location Input Field with Icon
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: Colors.amber[700]),
                labelText: 'Enter Your Location',
                labelStyle: TextStyle(color: Colors.amber[700]),
                hintText: 'e.g. City, Postal Code',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 243, 166, 33)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Search Button with Animation
            ElevatedButton(
              onPressed: () {
                // Add search functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber[700],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Container(
                width: size.width * 0.9, // 90% of screen width
                padding: EdgeInsets.symmetric(vertical: 12),
                child:Center(
                  child: Text('Search',
                  style: TextStyle(
                    fontSize: 18,
                  ),
              
                  ),


                )
              ),
            ),
            SizedBox(height: 10),

            // Map Display with Loader
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 14.0,
                    ),
                  ),
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Continue Button with Responsive Width
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearbyToolRantPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Container(
                width: size.width * 0.3, // 90% of screen width
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
