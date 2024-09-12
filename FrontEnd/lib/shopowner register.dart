import 'package:flutter/material.dart';

class ShopOwnerRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form For Shop Owner'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Shop Name',
                  hintText: 'Enter your shop name',
                ),
              ),
              SizedBox(height: 10),
              Text('Tool Type', style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                runSpacing: 8.0,
                children: <Widget>[
                  FilterChip(
                      label: Text('Plumbing tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Electrical tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Carpentry tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Painting tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Gardening tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Repairing tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Building tool'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: Text('Phone accessories'),
                      onSelected: (bool selected) {}),
                  FilterChip(
                      label: const Text('Mechanical tools'),
                      onSelected: (bool selected) {}),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'e.g. City, Postal Code',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'More Options',
                  hintText: 'Enter additional information',
                ),
              ),
              SizedBox(height: 20),
              Text('Terms and Conditions',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'By using the Handyman App, you agree to these terms. Provide '
                'accurate information during registration. You are responsible for '
                'keeping your account details secure. Must ensure tools are '
                'described accurately, safe, and functional. The app only connects '
                'users and providers. We are not responsible for the quality or '
                'outcome of services or tools provided. You must provide accurate '
                'contact information.',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Do You Agree?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      ElevatedButton(onPressed: () {}, child: Text('YES')),
                      SizedBox(width: 10),
                      ElevatedButton(onPressed: () {}, child: Text('NO')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
