import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/user-renttools/Nearby_Tool_Shops.dart';
import 'package:tap_on/user-services/showprovider.dart'; // Ensure this import is correct

class TLocationPage extends StatelessWidget {
  const TLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapOn'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController locationController = TextEditingController();
  final List<String> locations = ['Colombo', 'Trincomalee', 'Kandy', 'Jaffna'];

  void _addLocation() {
    if (locationController.text.isNotEmpty) {
      setState(() {
        locations.add(locationController.text);
        locationController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.amber,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Location Details',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Choose Your Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 233, 231, 207),
            child: GridView.count(
              crossAxisCount: 1, // 1 column
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio: 6, // Adjust to make the items wide rectangles
              children: [
                ServiceCard(
                  label: 'Colombo',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Gampaha',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kalutara',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kandy',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Matale',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Nuwara Eliya',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Galle',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Matara',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Hambantota',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Jaffna',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kilinochchi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Mannar',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Vavuniya',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Mullaitivu',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Batticaloa',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Ampara',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Trincomalee',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kurunegala',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Puttalam',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Anuradhapura',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Polonnaruwa',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Badulla',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Monaragala',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Ratnapura',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kegalle',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NearbyToolRentPage(), // Changed here
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 250, 184, 78),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
