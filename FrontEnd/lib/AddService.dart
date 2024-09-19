import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:tap_on/providerDashboard.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  _AddSErvicePageState createState() => _AddSErvicePageState();
}

class _AddSErvicePageState extends State<AddServicePage> {
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

  bool enableTimeDuration = false;
  TextEditingController timeDurationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Service"),
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
          child: Form(
            key: _formKey, // Use a form key to validate inputs
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Name *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Service',
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
                      setState(
                        () {
                          isNew = value!;
                        },
                      );
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
                child: Text('Service  Category'),
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
                      label: const Text('Electrician'),
                      selected: selectedCategory == 'Electrician',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Electrician';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Carpentry'),
                      selected: selectedCategory == 'Carpentry',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Carpentry';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Painting'),
                      selected: selectedCategory == 'Painting',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Painting';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Gardening'),
                      selected: selectedCategory == 'Gardening',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Gardening';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Repairing'),
                      selected: selectedCategory == 'Repairing',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Repairing';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Building'),
                      selected: selectedCategory == 'Building',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Building';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('Phone Repairing'),
                      selected: selectedCategory == 'Phone Repairing',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'Phone Repairing';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('beauty professional'),
                      selected: selectedCategory == 'beauty professional',
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = 'beauty professional';
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              Text("Service Image"),
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
              SizedBox(height: 16),
              SwitchListTile(
                title: Text("Enable Time Duration"),
                value: enableTimeDuration,
                onChanged: (bool value) {
                  setState(() {
                    enableTimeDuration = value;
                    if (!enableTimeDuration) {
                      // Clear the time duration if the switch is disabled
                      timeDurationController.clear();
                    }
                  });
                },
              ),

              // Conditionally show and validate the "Time Duration" field
              if (enableTimeDuration) ...[
                SizedBox(height: 8),
                TextFormField(
                  controller: timeDurationController,
                  decoration: InputDecoration(
                    labelText: 'Time Duration (in hours)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a time duration';
                    }
                    return null;
                  },
                ),
              ],

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Only submit if the form is valid
                    if (enableTimeDuration) {
                      print('Time Duration: ${timeDurationController.text} hours');
                    }
                  }
                },
                child: Text("Submit"),
              ),
             


              SizedBox(height: 16),
              Text("Price"),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add discounts functionality
                },
                child: Text("+ Add Discounts"),
              ),
              SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Working Dates"),
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
              Text("Working Hours"),

// Time Range
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
                          builder: (context) => Providerdashboard()),
                    );
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: (Colors.yellow[700]) // Full width button
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
