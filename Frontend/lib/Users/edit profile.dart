import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String phoneNumber = '';
  String email = '';
  DateTime birthday = DateTime.now();
  String gender = 'Male';
  String address = '';
  String location = '';
  File? profilePhoto;

  Future<void> createOrUpdateProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare the request body
      final requestBody = {
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'email': email,
        'birthday': birthday.toIso8601String(),
        'gender': gender,
        'address': address,
        'location': location,
        // Add logic for photo upload here (if needed)
      };

      // Send a POST request to the backend
      final response = await http.post(
        Uri.parse('http://localhost:3000/profile'), // Update with your backend URL
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Successfully created or updated the profile
        final responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['success'])),
        );
      } else {
        // Handle error
        final responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'])),
        );
      }
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profilePhoto = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Management'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Please enter your full name' : null,
                onSaved: (value) => fullName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                onSaved: (value) => phoneNumber = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Birthday',
                  hintText: 'Select your birthday',
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: birthday,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != birthday) {
                    setState(() {
                      birthday = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text: "${birthday.toLocal()}".split(' ')[0], // Show selected date
                ),
              ),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(labelText: 'Gender'),
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    gender = newValue!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
                onSaved: (value) => address = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) => value!.isEmpty ? 'Please enter your location' : null,
                onSaved: (value) => location = value!,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: pickImage,
                child: Column(
                  children: [
                    if (profilePhoto != null)
                      Image.file(
                        profilePhoto!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    else
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey[300],
                        child: Center(child: Text('No photo selected')),
                      ),
                    SizedBox(height: 8),
                    Text(
                      'Tap to upload profile photo',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: createOrUpdateProfile,
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
