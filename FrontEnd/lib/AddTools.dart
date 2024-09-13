import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddToolPage extends StatefulWidget {
  const AddToolPage({super.key});

  @override
  _AddToolPageState createState() => _AddToolPageState();
}

class _AddToolPageState extends State<AddToolPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  bool isNew = true;
  DateTimeRange? selectedDateRange;
  TimeOfDay? selectedTimeSlot;
  // Function to pick a time slot
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeSlot ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTimeSlot) {
      setState(() {
        selectedTimeSlot = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('Add Tool for Rent'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Tool Name
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tool Name'),
                ),

                // Description
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Briefly describe tool features and condition',
                  ),
                  maxLines: 2,
                ),

                // Category
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

                // Rental Price
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Rental Price'),
                  keyboardType: TextInputType.number,
                ),

                // Available Quantity
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Available Quantity'),
                  keyboardType: TextInputType.number,
                ),

                // Contact Information
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Contact Information',
                    hintText: 'Enter phone number or email',
                  ),
                ),

                // Add Images
                ElevatedButton(
                  onPressed: () {
                    // Handle image upload
                  },
                  child: const Text('Add Images'),
                ),

                // Available Dates
                ListTile(
                  title: Text(
                    selectedDateRange == null
                        ? 'Set date range tool is available'
                        : 'Available from: ${DateFormat.yMMMd().format(selectedDateRange!.start)} to ${DateFormat.yMMMd().format(selectedDateRange!.end)}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDateRange = picked;
                      });
                    }
                  },
                ),

// Time Slot
                ListTile(
                  title: Text(
                    selectedTimeSlot == null
                        ? 'Set available time slot'
                        : 'Selected Time Slot: ${selectedTimeSlot!.format(context)}',
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () => _selectTime(context),
                ),

                // Add Tool Button
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Add Tool'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}