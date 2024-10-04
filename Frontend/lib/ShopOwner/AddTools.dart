import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  bool isNew = true;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  // Weekdays selection
  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<String> selectedWeekdays = [];

// Function to pick a time
  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart
          ? (startTime ?? TimeOfDay.now())
          : (endTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLength: 280,
                maxLines: 3,
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text("Enable Reference ID"),
                value: false,
                onChanged: (bool value) {},
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ref ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Condition
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Condition'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isNew,
                    onChanged: (value) {
                      setState(() {
                        isNew = value!;
                      });
                    },
                  ),
                  const Text('New'),
                  Radio<bool>(
                    value: false,
                    groupValue: isNew,
                    onChanged: (value) {
                      setState(() {
                        isNew = value!;
                      });
                    },
                  ),
                  const Text('Used'),
                ],
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Category'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 8.0, // Horizontal space between items
                  runSpacing:
                      4.0, // Vertical space between lines (if wrapping occurs)

                  children: [
                    ChoiceChip(
                      label: const Text('Plumbing'),
                      selected: selectedCategory == 'Plumbing',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Plumbing';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Electrical'),
                      selected: selectedCategory == 'Electrical',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Electrical';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Carpentry Tools'),
                      selected: selectedCategory == 'Carpentry Tools',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Carpentry Tools';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Painting tool'),
                      selected: selectedCategory == 'Painting tool',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Painting tool';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Gardening tool'),
                      selected: selectedCategory == 'Gardening tool',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Gardening tool';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Repairing tool'),
                      selected: selectedCategory == 'Repairing tool',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Repairing tool';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Building tool'),
                      selected: selectedCategory == 'Building tool',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Building tool';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Phone accessories'),
                      selected: selectedCategory == 'Phone accessories',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Phone accessories';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Mechanical tool'),
                      selected: selectedCategory == 'Mechanical tool',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Mechanical tool';
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              Text("Item Image"),
              GestureDetector(
                onTap: () {
                  // Functionality to upload image
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.camera_alt),
                ),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text("Purchase Limit"),
                value: false,
                onChanged: (bool value) {},
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Limit(available quantity)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Text("Item Price"),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              Text("Availability"),
              Column(
                children: [
                  RadioListTile(
                    title: Text("Available"),
                    value: 1,
                    groupValue: 1,
                    onChanged: (int? value) {},
                  ),
                  RadioListTile(
                    title: Text("Sold out for today"),
                    value: 2,
                    groupValue: 1,
                    onChanged: (int? value) {},
                  ),
                  RadioListTile(
                    title: Text("Unavailable"),
                    value: 3,
                    groupValue: 1,
                    onChanged: (int? value) {},
                  ),
                ],
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add discounts functionality
                },
                child: Text("+ Add Tool Discounts"),
              ),
              SizedBox(height: 16),

              Text("Selling Dates"),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Available Weekdays'),
              ),
              Wrap(
                spacing: 8.0,
                children: weekdays.map((day) {
                  return FilterChip(
                    label: Text(day),
                    selected: selectedWeekdays.contains(day),
                    onSelected: (isSelected) {
                      setState(() {
                        isSelected
                            ? selectedWeekdays.add(day)
                            : selectedWeekdays.remove(day);
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 16),
              Text("Selling Hours"),

              ListTile(
                title: Text(
                  startTime == null || endTime == null
                      ? 'Set available time range'
                      : 'Selected Time Range: ${startTime!.format(context)} - ${endTime!.format(context)}',
                ),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  await _selectTime(context, true); // Select start time
                  await _selectTime(context, false); // Select end time
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopdashboardPage()),
                    );
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: (Colors.yellow[700])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
