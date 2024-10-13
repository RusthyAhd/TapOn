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
      };

      // Send a POST request to the backend
      final response = await http.post(
        Uri.parse(
            'http://localhost:3000/profile'), // Update with your backend URL
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
        backgroundColor: Colors.amber[700],
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: profilePhoto != null
                            ? FileImage(profilePhoto!)
                            : AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                        backgroundColor: Colors.grey[200],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber[700],
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your full name'
                            : null,
                        onSaved: (value) => fullName = value!,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your phone number'
                            : null,
                        onSaved: (value) => phoneNumber = value!,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your email' : null,
                        onSaved: (value) => email = value!,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Birthday',
                          hintText: 'Select your birthday',
                          prefixIcon: Icon(Icons.calendar_today),
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
                          text: "${birthday.toLocal()}"
                              .split(' ')[0], // Show selected date
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: gender,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
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
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          prefixIcon: Icon(Icons.home),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your address' : null,
                        onSaved: (value) => address = value!,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'District',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your district'
                            : null,
                        onSaved: (value) => location = value!,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: createOrUpdateProfile,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 60),
                  child: Text('Save Profile', style: TextStyle(fontSize: 18)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
