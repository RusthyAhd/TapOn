import 'package:flutter/material.dart';
import 'package:tap_on/user-renttools/showToolshop.dart';

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
        title: Text('Products'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Location'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Electronics'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Filters'),
                ),
              ],
            ),
            SizedBox(height: 10),
            // List of items
            Expanded(
              child: ListView(
                children: [
                  productTile(
                      context,
                      'OnePlus 11R 256GB 12GB RAM',
                      'Rs 89,000',
                      'Colombo, Mobile Phones',
                      'https://via.placeholder.com/150'), // Example Image URL
                  productTile(
                      context,
                      'Xiaomi Redmi 12 8GB | 128GB (Used)',
                      'Rs 30,000',
                      'Colombo, Mobile Phones',
                      'https://via.placeholder.com/150'),
                  productTile(
                      context,
                      'Apple iPhone 15 Pro 128GB (New)',
                      'Rs 295,000',
                      'Colombo, Mobile Phones',
                      'https://via.placeholder.com/150'),
                  productTile(
                      context,
                      'Samsung Galaxy M51 6GB 128GB (Used)',
                      'Rs 34,500',
                      'Kegalle, Mobile Phones',
                      'https://via.placeholder.com/150'),
                  productTile(
                      context,
                      'ZTE A35 2GB/64GB (New)',
                      'Rs 23,680',
                      'Colombo, Mobile Phones',
                      'https://via.placeholder.com/150'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productTile(BuildContext context, String title, String price,
      String location, String imageUrl) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price),
            Text(location),
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
