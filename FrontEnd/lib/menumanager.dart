import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'id': 5878694,
      'name': 'Hammer x 01',
      'price': 249.00,
      'available': true,
      'image': 'assets/hammmer.png'
    },
    {
      'id': 5878695,
      'name': 'brush x 04',
      'price': 595.00,
      'available': false,
      'image': 'assets/rotti.png'
    },
  ];

  // Controllers for the form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool available = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Menu Management'),
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
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  var item = menuItems[index];
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Image.asset(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['name']),
                      subtitle: Text('LKR ${item['price']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['available'] ? 'Available' : 'Not Available',
                            style: TextStyle(
                                color: item['available']
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          SizedBox(width: 8),
                          // Edit Button
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Open the dialog to edit item
                              _editItemDialog(context, item, index);
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              // View action
                            },
                            child: Text('Edit'),
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

  // Moved the _editItemDialog method inside the _MenuScreenState class
  void _editItemDialog(
      BuildContext context, Map<String, dynamic> item, int index) {
    // Pre-fill form fields with existing values
    nameController.text = item['name'];
    priceController.text = item['price'].toString();
    available = item['available'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Price'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Available:'),
                      Switch(
                        value: available,
                        onChanged: (bool value) {
                          setState(() {
                            available = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Update the item details
                setState(() {
                  menuItems[index]['name'] = nameController.text;
                  menuItems[index]['price'] =
                      double.tryParse(priceController.text) ?? 0.0;
                  menuItems[index]['available'] = available;
                });
                Navigator.of(context).pop();
              }, 
            ),
          ],
        );
      },
    );
  }
}
