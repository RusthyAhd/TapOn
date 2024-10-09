import 'package:flutter/material.dart';
import 'package:tap_on/user-renttools/User%20product%20details.dart';

class Toolmenu extends StatelessWidget {
  final String shopName; // Shop name to display relevant tools
  final List<Map<String, String>> products; // List of products in the shop

  Toolmenu({required this.shopName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$shopName Products',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor:Colors.orangeAccent,
      ),
      body: Container(
        // Add gradient background
         decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.yellow[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // List of items specific to this shop
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return productTile(
                      context,
                      product['title']!,
                      product['price']!,
                      product['image']!,
                      product['description']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productTile(
      BuildContext context, String title, String price, String image, String description) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners for the card
      ),
      elevation: 5, // Add shadow to the card for a raised effect
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(12), // Add more padding inside the tile
        leading: Hero( // Hero animation for smooth image transition
          tag: title, // Ensure tag is unique for each product
          child: Image.asset(image, width: 70, height: 70),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          '$price',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.green,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {
          // Navigate to ProductDetailsPage with product details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                title: title,
                price: price,
                image: image,
                description: description,
              ),
            ),
          );
        },
      ),
    );
  }
}
