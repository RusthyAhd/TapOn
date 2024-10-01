import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';
import 'package:tap_on/Providers/providerDashboard.dart';

class ProviderProfilePage extends StatefulWidget {
  @override
  _ProviderProfilePageState createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
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

  // Boolean flags to toggle the editability of each field
  bool isEmailEditable = false;
  bool isPhoneEditable = false;
  bool isNameEditable = false;
  bool isShopNameEditable = false;
  bool isAddressEditable = false;
  bool isLocationEditable = false;
  bool isDescriptionEditable = false;

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
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    AssetImage('provider.png'), // Add your logo here
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopdashboardPage()),
                    );
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: (Colors.yellow[700]) // Full width button
                      ),
                ),
              ),
            ],
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
