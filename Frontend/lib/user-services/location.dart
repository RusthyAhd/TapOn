import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/user-services/showprovider.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _locationController = TextEditingController();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(8.569, 81.234); // Default to Kinniya

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text('Location'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Location Input Field
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Your Location Details',
                hintText: 'e.g. City, Postal Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Search Button
            ElevatedButton(
              onPressed: () {
                // Add search functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black, // Text color
              ),
              child: Text('Add'),
            ),
            SizedBox(height: 10),
            // Map Display
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("selected-location"),
                    position: _center,
                  ),
                },
              ),
            ),
            SizedBox(height: 10),
            // Continue Button at the Bottom
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NearbyServiceProvidersPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow, // Button color
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
