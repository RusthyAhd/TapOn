import 'package:flutter/material.dart';

class US_RequestSending extends StatefulWidget {
  const US_RequestSending({super.key});

  @override
  _US_RequestSendingState createState() => _US_RequestSendingState();
}

class _US_RequestSendingState extends State<US_RequestSending> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _PhonenoController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _nameController.dispose();
    _PhonenoController.dispose();
    _LocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        // Enables scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Booking Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Booking ID', style: TextStyle(color: Colors.grey)),
                  Text('162267901', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text('Date:', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Text('September 15, 2024'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text('Time:', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Text('12:00 PM'),
                ],
              ),
              const SizedBox(height: 25),

              // Editable Customer Details
              const Text(
                "About Customer",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Customer Name
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Customer Name',
                          hintText: 'Enter customer name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
             
                      const SizedBox(height: 10),
                      // Customer Phone Number
                      TextFormField(
                        controller: _PhonenoController,
                        decoration: const InputDecoration(
                          labelText: 'Phone No',
                          hintText: 'Enter Phone Number',
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Customer Location
                      TextFormField(
                        controller: _LocationController,
                        decoration: const InputDecoration(
                          labelText: 'Location',
                          hintText: 'Enter Location',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Price Details
              const Text('Price Detail', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildPriceRow('Price', '\$26.00 * 1 = \$26.00'),
                    const Divider(),
                    _buildPriceRow('Sub Total', '\$26.00'),
                    const Divider(),
                    _buildPriceRow('Total Amount', '\$26.00', isBold: true),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If form is valid, print the details
                      print('Name: ${_nameController.text}');
                      print('Phone no: ${_PhonenoController.text}');
                      print('Location: ${_LocationController.text}');
                      // Perform additional actions like sending data to the server
                    }
                  },
                  child: const Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Optional color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(String title, String price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
