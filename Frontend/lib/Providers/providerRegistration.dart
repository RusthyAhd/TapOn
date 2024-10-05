import 'package:flutter/material.dart';
import 'package:tap_on/Providers/providerDashboard.dart';

class ServiceProviderRegistrationForm extends StatefulWidget {
  @override
  _ServiceProviderRegistrationFormState createState() =>
      _ServiceProviderRegistrationFormState();
}

class _ServiceProviderRegistrationFormState
    extends State<ServiceProviderRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool agreeToTerms = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Registration Form For Service Provider'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Service Title Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Service Title',
                  hintText: 'Enter your Occupation',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your occupation';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Service Type Field (using FilterChip)
              Text(
                'Service Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  FilterChipWidget(label: 'Plumbing'),
                  FilterChipWidget(label: 'Electrical work'),
                  FilterChipWidget(label: 'Carpentering'),
                  FilterChipWidget(label: 'Painting'),
                  FilterChipWidget(label: 'Gardening'),
                  FilterChipWidget(label: 'Repairing(fridges...)'),
                  FilterChipWidget(label: 'Building'),
                  FilterChipWidget(label: 'Phone repairing'),
                  FilterChipWidget(label: 'Barber'),
                  FilterChipWidget(label: 'Other'),
                ],
              ),
              SizedBox(height: 16.0),

              // Phone Number Field
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Address Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Location Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Location',
                  hintText: 'e.g. City, Postal Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      .hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // More Options (Description)
              ExpansionTile(
                title: Text('More Options'),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Describe your Achievements',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Terms and Conditions
              Text(
                'Terms and Conditions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'By using the Handyman App, you agree to these terms. Provide accurate information during registration. You are responsible for keeping your account details secure. Must ensure tools are described accurately, safe, and functional. The app only connects users and providers. We are not responsible for the quality or safety of services or tools provided. You must provide accurate contact information.',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 16.0),

              // Agreement Checkbox
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    },
                  ),
                  Text('Do You Agree'),
                ],
              ),

              // Continue Button
              Center(
                child: ElevatedButton(
                  onPressed: agreeToTerms
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Providerdashboard(),
                              ),
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.yellow,
                  ),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable FilterChipWidget
class FilterChipWidget extends StatefulWidget {
  final String label;

  FilterChipWidget({required this.label});

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.label),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.yellow[700],
    );
  }
}
