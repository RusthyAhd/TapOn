import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';
import 'package:http/http.dart'
    as http; // Import the HTTP package for backend communication.
import 'dart:convert'; // For JSON encoding/decoding.
import '../database/config.dart';

class ShopOwnerRegistration extends StatefulWidget {
  const ShopOwnerRegistration({super.key});

  @override
  _ShopOwnerRegistrationState createState() => _ShopOwnerRegistrationState();
}

class _ShopOwnerRegistrationState extends State<ShopOwnerRegistration> {
  // Create controllers for each TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isAgreed = false; // Track if the user has agreed to the terms
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Function to handle the submission of form data
  Future<void> registerOwner() async {
    if (_formKey.currentState!.validate() && isAgreed) {
      // Prepare the data for submission
      Map<String, String> shopownerData = {
        'name': nameController.text,
        'shop_name': shopNameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'location': locationController.text,
        'email': emailController.text,
      };

      try {
        // Send POST request to backend with user data
        var response = await http.post(
          Uri.parse(registration),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(shopownerData),
        );

        if (response.statusCode == 200) {
          // Successfully saved data to MongoDB, navigate to the dashboard
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopdashboardPage(),
            ),
          );
          print('Registered successfull');
        } else {
          // Handle error from the backend
          print('Failed to save data. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error occurred while submitting data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'Registration Form For Shop Owner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: shopNameController,
                  decoration: const InputDecoration(
                    labelText: 'Shop Name',
                    hintText: 'Enter your shop name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your shop name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    hintText: 'e.g. City, Postal Code',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Terms and Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  'By using the Handyman App, you agree to these terms. Provide '
                  'accurate information during registration. You are responsible for '
                  'keeping your account details secure. Must ensure tools are '
                  'described accurately, safe, and functional. The app only connects '
                  'users and providers. We are not responsible for the quality or '
                  'outcome of services or tools provided. You must provide accurate '
                  'contact information.',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Text('Do You Agree?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Checkbox(
                      value: isAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          isAgreed = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: isAgreed
                        ? registerOwner
                        : null, // Disable if not agreed
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow[700], // Button color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
