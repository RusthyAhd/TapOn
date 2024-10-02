import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for text fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save changes function
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.png'), // Your image here
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Functionality for changing photo
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
                  onPressed: () {
                    // Handle save changes action
                  },
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EditProfileScreen(),
  ));
}
