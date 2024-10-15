import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  TextEditingController _locationController = TextEditingController();
  bool _isLoadingLocation = false;
  String _currentAddress = "";
  LatLng? currentPosition;
  double? _latitude;
  double? _longitude;
  GoogleMapController? _mapController;
  Set<Marker> _markers = {}; // Set to hold all the markers

  // Function to check location permissions and get the current location
Future<void> _getCurrentLocation() async {
  setState(() {
    _isLoadingLocation = true;
  });

  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    setState(() {
      _currentAddress = 'Location services are disabled.';
      _isLoadingLocation = false;
    });
    return;
  }

  // Check location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      setState(() {
        _currentAddress = 'Location permissions are denied';
        _isLoadingLocation = false;
      });
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    setState(() {
      _currentAddress = 'Location permissions are permanently denied';
      _isLoadingLocation = false;
    });
    return;
  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // Reverse geocoding to get address from latitude and longitude
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  Placemark place = placemarks[0];

  setState(() {
    _latitude = position.latitude;
    _longitude = position.longitude;
    _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
    _isLoadingLocation = false;

    // Add a marker for the current location
    _addMarker(LatLng(_latitude!, _longitude!), 'My Current Location');

    // Move the map to the current location
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(_latitude!, _longitude!),  // Position the camera on the new location
          15,  // Zoom level, 15 is a good zoom for street-level view
        ),
      );
    }
  });
}


  // Method to add a marker at a specific location
  void _addMarker(LatLng position, String markerId) {
    final marker = Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(
          title: markerId,
          snippet: "Lat: ${position.latitude}, Lng: ${position.longitude}"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue), // Marker color
    );

    setState(() {
      _markers.add(marker); // Add the marker to the set
    });
  }

  void _goToCurrentLocation() async {
    final loc.Location location = loc.Location();
    final currentLocation = await location.getLocation();
    if (currentLocation.latitude != null && currentLocation.longitude != null) {
      setState(() {
        currentPosition = LatLng(
          currentLocation.latitude ?? 0.0,
          currentLocation.longitude ?? 0.0,
        );
      });
      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPosition!, zoom: 14),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Delivery Location'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input field for location search
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Enter a location',
                    suffixIcon: Icon(Icons.save),
                  ),
                ),
                SizedBox(height: 16.0),

                // Button to use current location
                ElevatedButton.icon(
                  onPressed: _getCurrentLocation,
                  icon: Icon(Icons.my_location),
                  label: Text('Use My Current Location'),
                ),

                SizedBox(height: 16.0),

                // Show loading spinner or the current address with coordinates
                _isLoadingLocation
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_currentAddress.isNotEmpty)
                            Text(
                              'Current Address: $_currentAddress',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          if (_latitude != null && _longitude != null)
                            Text(
                              'Latitude: $_latitude, Longitude: $_longitude',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          if (_latitude == null && _longitude == null)
                            Text('No location selected'),
                        ],
                      ),
              ],
            ),
          ),
          SizedBox(height: 16.0),

          // Google Maps widget to show the map with markers
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(48.8566, 2.3522), // Default to Paris if no location
                zoom: 12,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: _markers, // Markers set to display on the map
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new marker when the button is pressed
          _goToCurrentLocation();
        },
        child: Icon(Icons.add_location_alt),
      ),
    );
  }
}
