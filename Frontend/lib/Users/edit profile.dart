import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tap_on/database/config.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for the form fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // Dropdown options for gender
  List<String> genderOptions = ["Male", "Female", "Other"];
  String selectedGender = "";

  DateTime? selectedDate;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Create Profile API call
  Future<void> createProfile() async {
    final url = Uri.parse("http://localhost:3000/registration");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'gender': selectedGender,
        'birthday': selectedDate?.toIso8601String(), // Convert DateTime to ISO format
      }),
    );

    if (response.statusCode == 201) {
      print('Profile created successfully');
    } else {
      print('Failed to create profile: ${response.body}');
    }
  }

  // Fetch Profile by Email API call
  Future<void> _fetchProfile(String email) async {
    final url = Uri.parse("http://localhost:3000" + "/$email");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final profile = jsonDecode(response.body);
      setState(() {
        _nameController.text = profile['name'];
        _emailController.text = profile['email'];
        _phoneController.text = profile['phone'];
        selectedGender = profile['gender'];
        selectedDate = DateTime.parse(profile['birthday']);
      });
    } else {
      print('Failed to fetch profile: ${response.body}');
    }
  }

  // Update Profile API call
  Future<void> _updateProfile(String email) async {
    final url = Uri.parse("http://localhost:3000" + "/$email");
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text,
        'phone': _phoneController.text,
        'gender': selectedGender,
        'birthday': selectedDate?.toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      print('Profile updated successfully');
    } else {
      print('Failed to update profile: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/muhammed.jpeg'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Logic to change photo
                      },
                      child: Text('Change Photo'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('Details', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                ),
              ),
              SizedBox(height: 8),
              // Birthday field
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                  ),
                  child: Text(
                    selectedDate != null
                        ? "${selectedDate!.toLocal()}".split(' ')[0]
                        : 'Select your birthday..',
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Gender dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                value: selectedGender.isNotEmpty ? selectedGender : null,
                items: genderOptions
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Handle cancel action
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_emailController.text.isNotEmpty) {
                        // If profile exists, update it
                        await _updateProfile(_emailController.text);
                      } else {
                        // If new profile, create it
                        await createProfile();
                      }
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
