import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String description; // Add a description field

  // Constructor to pass the product details
  ProductDetailsPage({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        // Add gradient background for visual appeal
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.yellow[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag:
                      title, // Tag to match with the image in the list view for smooth animation
                  child: Image.asset(image, height: 250, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '$price',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5, // Line spacing for better readability
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
          
                //call button process
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Handle "call" action
                    },
                    child: const Text(
                      'call',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
          
          ),
        ),
      );
  
  }
}

// Updated productTile method to match the enhanced design
Widget productTile(
    BuildContext context, String title, String price, String image) {
  String description = ''; // Add a description for each product
  if (title == 'Hammer (New)') {
    description =
        'This is a high-quality new hammer made for heavy-duty usage.';
  } else if (title == 'Pliers (Used)') {
    description = 'Used pliers in good condition. Suitable for small repairs.';
  } else if (title == 'Screwdrivers (New)') {
    description = 'A set of new screwdrivers. Perfect for electrical work.';
  } else if (title == 'Wire Stripper (Used)') {
    description =
        'Used wire stripper in functional condition. Great for electricians.';
  } else if (title == 'Flame Retardant Shirt (New)') {
    description =
        'New flame retardant shirt for protection in hazardous environments.';
  }

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // Rounded corners for the card
    ),
    elevation: 5, // Shadow for a raised effect
    margin: EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      contentPadding: EdgeInsets.all(12), // Padding inside the tile
      leading: Hero(
        // Hero animation for image
        tag: title,
        child: Image.asset(image, width: 70, height: 70),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        '\$$price',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.green,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.amber),
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
