import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tap_on/Providers/providerDashboard.dart';

class ServiceProviderRegistrationForm extends StatefulWidget {
  const ServiceProviderRegistrationForm({super.key});
  @override
  _ServiceProviderRegistrationFormState createState() =>
      _ServiceProviderRegistrationFormState();
}

class _ServiceProviderRegistrationFormState
    extends State<ServiceProviderRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceTitleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  bool isAgreed = false;

  // Method to handle registration process
  Future<void> registerServiceProvider() async {
    if (_formKey.currentState!.validate() && isAgreed) {
      // Preparing the data to send to backend
      Map<String, String> providerData = {
        'name': nameController.text,
        'service_title': serviceTitleController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'location': locationController.text,
        'email': emailController.text,
      };

      try {
        // API call for service provider registration
        var response = await http.post(
          Uri.parse('http://localhost:3000/serviceregistration'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(providerData),
        );

        if (response.statusCode == 200) {
          // Successfully saved data to MongoDB, navigate to the dashboard
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Providerdashboard(),
            ),
          );
          print('Provider Details successfully Registered ');
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
        title: Text('Service Provider Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: serviceTitleController,
                decoration: const InputDecoration(
                  labelText: 'Service Title',
                  hintText: 'Enter your occupation',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your occupation';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'City or Postal Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
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
                      ? registerServiceProvider
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
    );
  }
}
