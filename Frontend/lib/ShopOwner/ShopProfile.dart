import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';

class ShopProfilePage extends StatefulWidget {
  @override
  _ShopProfilePageState createState() => _ShopProfilePageState();
}

class _ShopProfilePageState extends State<ShopProfilePage> {
  // TextEditingControllers for each field
  TextEditingController emailController =
      TextEditingController(text: 'teatime.ho@merchant.lk');
  TextEditingController phoneController =
      TextEditingController(text: '0740710280');
  TextEditingController OwnerNameController =
      TextEditingController(text: 'Hamthy');
  TextEditingController shopNameController =
      TextEditingController(text: 'Tea Time (Homagama)');
  TextEditingController shopAddressController = TextEditingController(
      text:
          'Institute of Technology University of Moratuwa, \nHomagama-Diyagama Rd');
  TextEditingController shopLocationController =
      TextEditingController(text: 'city,postal code');
  TextEditingController shopDescriptionController =
      TextEditingController(text: 'Our shop provide.....');

  // Boolean flags to toggle the editability of each field
  bool isEmailEditable = false;
  bool isPhoneEditable = false;
  bool isOwnerNameEditable = false;
  bool isShopNameEditable = false;
  bool isShopAddressEditable = false;
  bool isShopLocationEditable = false;
  bool isShopDescriptionEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Profile'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShopdashboardPage()));
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
                backgroundImage: AssetImage(
                    'assets/tea_time_logo.png'), // Add your logo here
              ),
              SizedBox(height: 10),
              Text(
                'Hamthy Hardware',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Institute of Technology University of Moratuwa, \nHomagama-Diyagama Rd',
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
              buildEditableTile(
                  'Owner Name', OwnerNameController, isOwnerNameEditable, () {
                setState(() {
                  isOwnerNameEditable = !isOwnerNameEditable;
                });
              }),
              buildEditableTile(
                  'Shop Name', shopNameController, isShopNameEditable, () {
                setState(() {
                  isShopNameEditable = !isShopNameEditable;
                });
              }),
              buildEditableTile(
                  'Shop Address', shopAddressController, isShopAddressEditable,
                  () {
                setState(() {
                  isShopAddressEditable = !isShopAddressEditable;
                });
              }),
              buildEditableTile('Shop Location', shopLocationController,
                  isShopLocationEditable, () {
                setState(() {
                  isShopLocationEditable = !isShopLocationEditable;
                });
              }),
              buildEditableTile('Shop Description', shopDescriptionController,
                  isShopDescriptionEditable, () {
                setState(() {
                  isShopDescriptionEditable = !isShopDescriptionEditable;
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
