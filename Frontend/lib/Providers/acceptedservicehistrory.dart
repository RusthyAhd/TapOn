import 'package:flutter/material.dart';
import 'package:tap_on/Providers/rejectedProvider.dart';

class Acceptservicehistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TapOn Provider',
              style: TextStyle(
                fontSize: 20, // You can adjust the size
                fontWeight: FontWeight.bold, // Optional: Makes the text bold
              ),
            ),
            const Text(
              'Accepted Orders',
              style: TextStyle(
                fontSize: 16, // You can adjust the size
                fontWeight: FontWeight.normal, // Optional: Normal text weight
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2, // Adjust based on your data
                itemBuilder: (context, index) {
                  return orderItem(
                    context: context, // Pass the context here
                    orderId: '162267901',
                    orderName: 'Sanitize full home',
                    date: '12 Sept 2024, 9:31 am',
                    customerName: 'Rishaf',
                    customerLocation: 'No-2, Kinniya',
                    customerMobile: '0755354023',
                    status: '2ND ORDER',
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Your orders show here',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderItem({
    required BuildContext context, // Add BuildContext as a required parameter
    required String orderId,
    required String orderName,
    required String date,
    required String customerName,
    required String customerLocation,
    required String customerMobile,
    required String status,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: $orderId',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Order: $orderName',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $date',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              'Customer Name: $customerName',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              'Customer Location: $customerLocation',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              'Customer Mobile: $customerMobile',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: $status',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CancelledOrderPage(),
                      ),
                    );
                  },
                  child: const Text('Reject'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
