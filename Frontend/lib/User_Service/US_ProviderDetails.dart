import 'package:flutter/material.dart';
import 'package:tap_on/User_Service/US_PreBooking.dart';

class US_ProviderDetails extends StatelessWidget {
  const US_ProviderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the service provider
    String providerName = 'Rishaf';
    String district = 'Downtown';
    double distance = 5.2; // in kilometers
    double consultantFee = 50.0; // fee in dollars
    double amountPerDay = 200.0; // amount in dollars

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Service Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service provider info
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/rishaf.jpg'),
                ),
                const SizedBox(width: 10),
                Text(providerName, style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 15),

            // Service name and description
            const Text('Plumbing',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/service_image.png',
                    height: 50, width: 50),
                const SizedBox(height: 10),
                const Text(
                  'Plumber with years of experience. Handles leaks and renovations efficiently.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Additional Provider Details
            Text('District: $district',
                style: const TextStyle(fontSize: 14)),
            Text('Distance: ${distance.toStringAsFixed(1)} km',
                style: const TextStyle(fontSize: 14)),
            Text('Consultant Fee: \$${consultantFee.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14)),
            Text('Amount per Day: \$${amountPerDay.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 15),

            // Reviews
            const Text('Reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: [
                const ReviewCard(),
                const SizedBox(height: 8),
                const ReviewCard(),
              ],
            ),
            const Spacer(),

            // Action buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: const Text('Booking Request'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const US_PreBooking()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: const Text('Pre Booking'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/guy_hawkins.jpg'),
        ),
        title: const Text('Guy Hawkins', style: TextStyle(fontSize: 14)),
        subtitle: const Text('Great service!'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 14),
            Text('4.9', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
