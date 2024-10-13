import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  List<String> genderOptions = [
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

  String selectedGender = "";
  bool isAgreed = false; // Track if the user has agreed to the terms
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  String? selectedCategory; // Variable to hold the selected category

  // List of categories for the dropdown
  final List<String> categories = [
    'Plumbing Tools',
    'Electrical Tools',
    'Carpenting Tools',
    'Painting Tools',
    'Gardening Tools',
    'Repairing Tools',
    'Building Tools',
    'Phone Accessories',
    'Other',
  ];

  // Function to handle the submission of form data
  Future<void> registerOwner() async {
    if (_formKey.currentState!.validate() && isAgreed) {
      // Prepare the data for submission
      Map<String, String> shopownerData = {
        'name': nameController.text,
        'shop_name': shopNameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'location': selectedGender,
        'email': emailController.text,
        'category': selectedCategory ?? '',
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
      };

      print('Submitting data: $shopownerData'); // Debug print

      try {
        // Send POST request to backend with user data
        var response = await http.post(
          Uri.parse('http://localhost:3000/shopregistration'),
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
          print('Shopowner Details successfully Registered');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful!')),
          );
        } else {
          // Handle error from the backend
          print('Failed to save data. Status code: ${response.statusCode}');
          print(
              'Response body: ${response.body}'); // Print response body for more info
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
        title: const Text(
          'Shop Owner Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                _buildTextField(
                  controller: nameController,
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  icon: Icons.person,
                ),
                _buildTextField(
                  controller: shopNameController,
                  labelText: 'Shop Name',
                  hintText: 'Enter your shop name',
                  icon: Icons.store,
                ),
                _buildTextField(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  icon: Icons.phone,
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
                _buildTextField(
                  controller: addressController,
                  labelText: 'Address',
                  hintText: 'Enter your address',
                  icon: Icons.home,
                ),
                _buildDropdownField(
                  labelText: 'Select Your District',
                  hintText: 'Select your district',
                  value: selectedGender.isNotEmpty ? selectedGender : null,
                  items: genderOptions,
                  icon: Icons.location_on,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                _buildTextField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                _buildTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                _buildDropdownField(
                  labelText: 'Category',
                  hintText: 'Select your category',
                  value: selectedCategory,
                  items: categories,
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
                  'outcome of services or tools provided.',
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
                    onPressed: isAgreed ? registerOwner : null,
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow[700],
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    IconData? icon,
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField({
    required String labelText,
    required String hintText,
    required String? value,
    required List<String> items,
    IconData? icon,
    ValueChanged<String?>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
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
