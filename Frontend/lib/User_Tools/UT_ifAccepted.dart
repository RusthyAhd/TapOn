//UT_ifAccepted
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UT_ifAccepted extends StatefulWidget {
  @override
  _UT_ifAcceptedState createState() => _UT_ifAcceptedState();
}

class _UT_ifAcceptedState extends State<UT_ifAccepted> {
  late GoogleMapController mapController;

  final LatLng _pickupLocation = LatLng(6.9271, 79.8612); // Example LatLng
  final LatLng _dropLocation = LatLng(6.9275, 79.8651); // Example LatLng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fixed map view
          Container(
            height: 300.0, // Fixed height for the map
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pickupLocation,
                zoom: 14.0,
              ),
              markers: {
                Marker(markerId: MarkerId('pickup'), position: _pickupLocation),
                Marker(markerId: MarkerId('drop'), position: _dropLocation),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: [_pickupLocation, _dropLocation],
                  color: Colors.blue,
                  width: 5,
                )
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),

          // Scrollable content
          Positioned(
            top: 250.0, // Slight overlap with the map for effect
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                                       // Status and provider details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Status text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Order Accepted',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '20°C Driver temperature - 1 days ago',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/car_icon.png', // Replace with your car icon
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),

                          Divider(),

                          // Provider details
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/driver_image.png'), // Replace with driver image
                                      radius: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sumithjayone',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Mini - Toyota Aqua G limited',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.amber, size: 16),
                                            SizedBox(width: 4),
                                            Text('4.5'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Call action
                                      },
                                      icon: Icon(Icons.call),
                                      color: Colors.green,
                                      iconSize: 30,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Message action
                                      },
                                      icon: Icon(Icons.message),
                                      color: Colors.blue,
                                      iconSize: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
