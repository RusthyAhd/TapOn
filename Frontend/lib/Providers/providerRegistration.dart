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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> locationOptions = [
    "Colombo",
    "Gampaha",
    "Kalutara",
    "Kandy",
    "Matale",
    "Nuwara Eliya",
    "Galle",
    "Matara",
    "Hambantota",
    "Jaffna",
    "Kilinochchi",
    "Mannar",
    "Vavuniya",
    "Batticaloa",
    "Ampara",
    "Trincomalee",
    "Polonnaruwa",
    "Anuradhapura",
    "Dambulla",
    "Kurunegala",
    "Puttalam",
    "Ratnapura",
    "Kegalle",
    "Badulla",
    "Monaragala",
  ];

  String selectedLocation = "";

  String? selectedCategory; // To store selected category
  final List<String> categories = [
    'Plumber',
    'Electrician',
    'Carpenter',
    'Painter',
    'Gardener',
    'Fridge Repair',
    'Beauty Professional',
    'Phone Repair',
    'Other'
  ]; // Category list

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
        'location': selectedLocation,
        'email': emailController.text,
        'category': selectedCategory!, // Add selected category
        'description': descriptionController.text,
        'password': passwordController.text,
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
          print('Provider Details successfully Registered');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful!')),
          );
        } else {
          // Handle error from the backend
          print('Failed to save data. Status code: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save data: ${response.body}')),
          );
        }
      } catch (error) {
        print('Error occurred while submitting data: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error occurred while submitting data')),
        );
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                icon: Icons.person,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: serviceTitleController,
                labelText: 'Service Title',
                hintText: 'Enter your occupation',
                icon: Icons.work,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: phoneController,
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                icon: Icons.phone,
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
              _buildTextField(
                controller: addressController,
                labelText: 'Address',
                hintText: 'Enter your address',
                icon: Icons.home,
              ),
              const SizedBox(height: 16.0),
              // Location Input Field with Icon
              _buildDropdownField(
                labelText: "Select Your District",
                hintText: 'Choose your district',
                value: selectedLocation.isNotEmpty ? selectedLocation : null,
                items: locationOptions,
                icon: Icons.location_on,
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value!;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Password Field
              _buildTextField(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Confirm Password Field
              _buildTextField(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                obscureText: true,
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Description Field
              _buildTextField(
                controller: descriptionController,
                labelText: 'Description',
                hintText: 'Enter a brief description of your services',
                maxLines: 3,
                icon: Icons.description,
              ),
              const SizedBox(height: 16.0),
              // Dropdown for category selection
              _buildDropdownField(
                labelText: 'Select Category',
                hintText: 'Choose your category',
                value: selectedCategory,
                items: categories,
                icon: Icons.category,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
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
                  child: const Text('Continue'),
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

  // Method to build text field with icon
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false,
    int maxLines = 1,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    required IconData icon,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
      ),
    );
  }

  // Method to build dropdown field with icon
  Widget _buildDropdownField({
    required String labelText,
    required String hintText,
    required String? value,
    required List<String> items,
    required IconData icon,
    ValueChanged<String?>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
