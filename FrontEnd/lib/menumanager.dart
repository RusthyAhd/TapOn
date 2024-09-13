import 'package:flutter/material.dart';



class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'id': 5878694, 'name': 'Wade x 01', 'price': 49.00, 'available': true, 'image': 'assets/wade.png'},
    {'id': 5878695, 'name': 'Pol Rotti x 01', 'price': 95.00, 'available': true, 'image': 'assets/rotti.png'},
    {'id': 5878696, 'name': 'Veg Samosa x 01', 'price': 115.00, 'available': true, 'image': 'assets/samosa.png'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add Item action
                  },
                  child: Text('+ Item'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.yellow),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Add Category action
                  },
                  child: Text('+ Category'),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.yellow),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  var item = menuItems[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(item['image'], width: 50, height: 50),
                      title: Text(item['name']),
                      subtitle: Text('LKR ${item['price']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['available'] ? 'Available' : 'Not Available',
                            style: TextStyle(color: item['available'] ? Colors.green : Colors.red),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              // View action
                            },
                            child: Text('View'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
