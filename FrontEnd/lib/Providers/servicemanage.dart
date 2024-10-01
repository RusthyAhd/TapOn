import 'package:flutter/material.dart';
import 'package:tap_on/Providers/AddService.dart';

class ManageService extends StatefulWidget {
  @override
  _ManageServiceState createState() => _ManageServiceState();
}

class _ManageServiceState extends State<ManageService> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'id': 5878697,
      'name': 'Home Maintanance',
      'price': 249.00,
      'available': true,
      'image': 'assets/service1.png'
    },
    {
      'id': 5878697,
      'name': 'Gardening',
      'price': 595.00,
      'available': false,
      'image': 'assets/service2.png'
    },
  ];

  // Controllers for the form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool available = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Service Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddServicePage()),
                      );
                      // Add Item action
                    },
                    child: Text('+ Item'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    var item = menuItems[index];

                    return Card(
                      elevation: 4,
                      child: ListTile(
                        leading: SizedBox(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.1,
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item['name']),
                        subtitle: Text('Price:LKR ${item['price']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                item['available']
                                    ? 'Available'
                                    : 'Not Available',
                                style: TextStyle(
                                    color: item['available']
                                        ? Colors.green
                                        : Colors.red),
                              ),
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
                                _editItemDialog(context, item, index);
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
          );
        }),
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
