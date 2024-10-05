import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreBookServicePage extends StatefulWidget {
  @override
  _PreBookServicePageState createState() => _PreBookServicePageState();
}

class _PreBookServicePageState extends State<PreBookServicePage> {
  DateTime _selectedDate = DateTime.now();
  String _formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _formattedTime = "";

  //function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // current date
      firstDate: DateTime(2000), // earliest date
      lastDate: DateTime(2100), // latest date
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to pick time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _formattedTime = picked.format(context); // Format the selected time
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Service'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Card
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Service Image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/service_image.jpg',), // Replace with your service image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Service Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plumbing',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text('Rishaf'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Address Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Address',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: Text('Choose From Map')),
                  TextButton(
                      onPressed: () {}, child: Text('Use Current Location')),
                ],
              ),

              // Description Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Booking Date & Slot Selector
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Selected date: $_formattedDate",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Selected time: $_formattedTime",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.orange,foregroundColor: Colors.black, // Background color of the button
                        ),
                        onPressed: () => _pickDate(context),
                        child: Text('Pick Date'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,foregroundColor: Colors.black,
                        ),
                        onPressed: () => _pickTime(context),
                        child: Text("Pick Time"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                'Price details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
SizedBox(height: 10,),
              // Price Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPriceRow('Price', 'Rs.25.00 * 1', 'Rs.25.00'),
                  buildPriceRow('Discount (4% off)', '', '-Rs.1.00',
                      isDiscount: true),
                  
                  Divider(),
                  buildPriceRow('Total Amount', '', 'Rs.29.20', isTotal: true),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow),
                  child: Text('PreBook'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceRow(String label, String unit, String price,
      {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isDiscount ? Colors.green : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Row(
            children: [
              if (unit.isNotEmpty) Text(unit),
              SizedBox(width: 10),
              Text(
                price,
                style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  fontSize: isTotal ? 18 : 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
