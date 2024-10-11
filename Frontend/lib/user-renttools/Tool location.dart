import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/user-renttools/Nearby_Tool_Shops.dart';

class TLocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<TLocationPage> {
  List<String> genderOptions = [
    "Colombo",
    "Trincomalee",
    "Batticaloa",
    "Kandy",
    "Jaffna",
    'Galle',
    'Ampara',
    'Anuradhapura',
    'Badulla',
    'Gampaha',
    'Hambantota',
  ];
  String selectedGender = "";
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
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.amber,
                ),
                labelText: "Select Your Location",
                labelStyle: TextStyle(color: Colors.amber),
              ),
              value: selectedGender.isNotEmpty ? selectedGender : null,
              items: genderOptions
                  .map((gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),

            // Search Button with Animation

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
