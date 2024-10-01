import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwnerDashboard.dart';

class ShopOwnerRegistration extends StatefulWidget {
  const ShopOwnerRegistration({super.key});

  @override
  _ShopOwnerRegistrationState createState() => _ShopOwnerRegistrationState();
}

class _ShopOwnerRegistrationState extends State<ShopOwnerRegistration> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'Registration Form For Shop Owner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Shop Name',
                  hintText: 'Enter your shop name',
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'e.g. City, Postal Code',
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              ExpansionTile(
                title: Text('More Options'),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Describe your landmark',
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between the fields
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Additional Info',
                      hintText: 'Enter more details if necessary',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Terms and Conditions',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                'By using the Handyman App, you agree to these terms. Provide '
                'accurate information during registration. You are responsible for '
                'keeping your account details secure. Must ensure tools are '
                'described accurately, safe, and functional. The app only connects '
                'users and providers. We are not responsible for the quality or '
                'outcome of services or tools provided. You must provide accurate '
                'contact information.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  const Text('Do You Agree?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  Checkbox(
                    value: isAgreed,
                    onChanged: (bool? value) {
                      setState(() {
                        isAgreed = value ?? false;
                      });
                    },
                  ),
                ],
              ), 
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: isAgreed
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopdashboardPage(),
                            ),
                          );
                        }
                      : null, // Disable if not agreed
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow[700], // Button color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 