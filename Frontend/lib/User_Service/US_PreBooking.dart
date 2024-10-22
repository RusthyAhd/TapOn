import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class US_PreBooking extends StatefulWidget {
  const US_PreBooking({super.key});

  @override
  _US_PreBookingState createState() => _US_PreBookingState();
}

class _US_PreBookingState extends State<US_PreBooking> {

    final TextEditingController _nameController = TextEditingController();
  final TextEditingController _PhonenoController = TextEditingController();
  final TextEditingController _emailController= TextEditingController();
final TextEditingController _LocationController= TextEditingController();
  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _nameController.dispose();
    _PhonenoController.dispose();
    _emailController.dispose();
    _LocationController.dispose();
    super.dispose();
  }

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
                          children: const [
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
              // Description Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
const Text(
              "About Customer",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
    
                child: Column(
                  children: [
                    // Customer Name
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Customer Name',
                        hintText: 'Enter customer name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    // Customer Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter customer email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    // Additional Information
                    TextFormField(
                      controller: _PhonenoController,
                      decoration: const InputDecoration(
                        labelText: 'Phone No',
                        hintText: 'Enter Phone Number',
                      ),
                    ),
                                        TextFormField(
                      controller: _LocationController,
                      decoration: const InputDecoration(
                        labelText: 'Location ',
                        hintText: 'Enter LOcation',
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  child: Text('Confirm'),
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
