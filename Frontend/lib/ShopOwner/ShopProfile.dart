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
      TextEditingController(text: 'City, Postal Code');
  TextEditingController shopDescriptionController = TextEditingController(
      text: 'Our shop provides the best quality tea in town.');

  List<String> districtOptions = [
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

  String selectedDistrict = '';

  // Boolean flags to toggle the editability of each field
  bool isEmailEditable = false;
  bool isPhoneEditable = false;
  bool isOwnerNameEditable = false;
  bool isShopNameEditable = false;
  bool isShopAddressEditable = false;
  bool isShopDescriptionEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
              // Shop Logo and Name
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/tea_time_logo.png'), // Add your logo here
              ),
              SizedBox(height: 15),
              Text(
                'Hamthy Hardware',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Institute of Technology University of Moratuwa, \nHomagama-Diyagama Rd',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),

              // Profile Information Cards
              buildProfileCard('Account Information'),
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

              // Dropdown for selecting district
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Proper padding for the location section
                child: _buildDropdownField(
                  labelText: 'District',
                  hintText: 'Select your district',
                  value: selectedDistrict.isNotEmpty ? selectedDistrict : null,
                  items: districtOptions,
                  icon: Icons.location_on,
                  onChanged: (value) {
                    setState(() {
                      selectedDistrict = value!;
                    });
                  },
                ),
              ),

              buildEditableTile('Shop Description', shopDescriptionController,
                  isShopDescriptionEditable, () {
                setState(() {
                  isShopDescriptionEditable = !isShopDescriptionEditable;
                });
              }),

              SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopdashboardPage(),
                    ),
                  );
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Colors.amber[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create section titles
  Widget buildProfileCard(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.amber[700],
          ),
        ),
      ),
    );
  }

  // Editable tiles with card design
  Widget buildEditableTile(String label, TextEditingController controller,
      bool isEditable, VoidCallback onTap) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: isEditable
            ? TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                ),
              )
            : Text(
                controller.text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
        trailing: Icon(Icons.edit, color: Colors.amber[700]),
        onTap: onTap,
      ),
    );
  }

  // Dropdown menu for district selection
  Widget _buildDropdownField({
    required String labelText,
    required String hintText,
    required String? value,
    required List<String> items,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.amber[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        value: value,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        icon: Icon(Icons.arrow_drop_down, color: Colors.amber[700]),
      ),
    );
  }
}
