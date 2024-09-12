import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _locationController = TextEditingController();
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(8.569, 81.234); // Default to a city like Kinniya

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                labelText: 'Enter Your Location',
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
              child: Text('Search'),
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
          ],
        ),
      ),
    );
  }
}
