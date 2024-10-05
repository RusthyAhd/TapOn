import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';
import 'package:tap_on/Providers/providerDashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProviderProfilePage extends StatefulWidget {
  @override
  _ProviderProfilePageState createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
final _formKey = GlobalKey<FormState>(); 

  // TextEditingControllers for each field
  TextEditingController emailController =
      TextEditingController(text: 'rishaf.ho@merchant.lk');
  TextEditingController phoneController =
      TextEditingController(text: '0740710280');
  TextEditingController NameController = TextEditingController(text: 'Rishaf');
  TextEditingController shopNameController =
      TextEditingController(text: 'Shop Name(if have)');
  TextEditingController AddressController =
      TextEditingController(text: 'No-02,Kinniya');
  TextEditingController LocationController =
      TextEditingController(text: 'city,postal code');
  TextEditingController DescriptionController =
      TextEditingController(text: 'More Details in occupation(achievement) ');
 File? _image;
  // Boolean flags to toggle the editability of each field
  bool isEmailEditable = false;
  bool isPhoneEditable = false;
  bool isNameEditable = false;
  bool isShopNameEditable = false;
  bool isAddressEditable = false;
  bool isLocationEditable = false;
  bool isDescriptionEditable = false;


    // Function to pick an image from the gallery or take a new picture
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // Show dialog to choose between camera and gallery
    final pickedFile = await showDialog<XFile>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );
   
    // Set the image if one was selected
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Profile'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Providerdashboard()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _image == null
                  ? Text('No image selected.')
                  : ClipOval(
                    child: Image.file(
                      _image!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    ),
              SizedBox(height: 20),
              // Button to pick a new image
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Change Profile'),
              ),
            
                SizedBox(height: 10),
                Text(
                  'Rishaf',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'No-02,Kinniya',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),
                buildInfoSection('Account'),
                buildEditableTile('Email', emailController, isEmailEditable, () {
                  setState(() {
                    isEmailEditable = !isEmailEditable;
                  });
                }),
                buildEditableTile(
                    'Phone Number', phoneController, isPhoneEditable, () {
                  setState(() {
                    isPhoneEditable = !isPhoneEditable;
                  });
                }),
                buildEditableTile('Name', NameController, isNameEditable, () {
                  setState(() {
                    isNameEditable = !isNameEditable;
                  });
                }),
                buildEditableTile(
                    'Shop Name', shopNameController, isShopNameEditable, () {
                  setState(() {
                    isShopNameEditable = !isShopNameEditable;
                  });
                }),
                buildEditableTile(
                    ' Address', AddressController, isAddressEditable, () {
                  setState(() {
                    isAddressEditable = !isAddressEditable;
                  });
                }),
                buildEditableTile(
                    'Shop Location', LocationController, isLocationEditable, () {
                  setState(() {
                    isLocationEditable = !isLocationEditable;
                  });
                }),
                buildEditableTile('Shop Description', DescriptionController,
                    isDescriptionEditable, () {
                  setState(() {
                    isDescriptionEditable = !isDescriptionEditable;
                  });
                }),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopdashboardPage()),
                      );
                    }
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                        
                        backgroundColor: (Colors.black),
                        foregroundColor: Colors.yellow
                        // Full width button
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

  Widget buildInfoSection(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Function to build an editable/non-editable tile
  Widget buildEditableTile(String label, TextEditingController controller,
      bool isEditable, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: isEditable
          ? TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(),
              ),
             validator: (value) {
              if (label == 'Email') {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                  return 'Enter a valid email address';
                }
              } else if (label == 'Phone Number') {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Enter a valid 10-digit phone number';
                }
              }
              return null;
            }, 
            )
          : Text(
              controller.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap, // Toggle edit mode for the specific field
    );
  }
}
