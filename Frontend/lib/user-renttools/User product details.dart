import 'package:flutter/material.dart';
import 'package:tap_on/user-renttools/Nearby_Tool_Shops.dart';

class Toolmenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NearbyToolRantPage()));
          },
        ),
        title: const Text('Products',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Colors.amber,
      ),
      body: 
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'What are you looking for?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Categories buttons

            SizedBox(height: 10),
            // List of items
            Expanded(
              child: ListView(
                children: [
                  productTile(context, 'Hammer (New)', 'Rs 1,000',
                      'assets/images/hammer.jpg'),
                  productTile(context, 'Pliers (Used)', 'Rs 300',
                      'assets/images/pliers.jpg'),
                  productTile(context, 'Screwdrivers (New)', 'Rs 1,900',
                      'assets/images/Screwdrivers.jpg'),
                  productTile(context, 'Wire Stripper (Used)', 'Rs 500',
                      'assets/images/Wire Stripper.jpeg'),
                  productTile(context, 'Flame Retardant Shirt (New)', 'Rs 680',
                      'assets/images/Flame Retardant Shirt.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productTile(
      BuildContext context, String title, String price, String image) {
    return Card(
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price),
          ],
        ),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // Add functionality on tap
        },
      ),
    );
  }
}
