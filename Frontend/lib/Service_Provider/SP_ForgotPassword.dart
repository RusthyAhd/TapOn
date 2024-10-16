import 'package:flutter/material.dart';
import 'package:tap_on/Service_Provider/SP_Login.dart';

class SP_ForgotPassword extends StatefulWidget {
  @override
  _SP_ForgotPasswordState createState() => _SP_ForgotPasswordState();
}

class _SP_ForgotPasswordState extends State<SP_ForgotPassword> {
  final _emailController = TextEditingController(); // Email field controller
  final _verifyController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isVerified = false;

  void _showPasswordFields() {
    // Show password fields after clicking verify
    setState(() {
      _isVerified = true;
    });
  }

  void _saveNewPassword() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Passwords do not match'),
      ));
      return;
    }

    // Show success message after resetting password
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password successfully reset'),
    ));
    // You can navigate back or do nothing here as per your needs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SP_Login()),
            );
            // Action when the button is pressed
          },
        ),
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email input field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Verification field
            TextField(
              controller: _verifyController,
              decoration: InputDecoration(
                labelText: 'Verify',
                hintText: 'Enter verification details',
              ),
            ),
            SizedBox(height: 20),

            // Verify and Reset Password button
            if (!_isVerified) ...[
              ElevatedButton(
                onPressed: _showPasswordFields,
                child: Text('Verify and Reset Password'),
              ),
            ],

            // New password fields shown after verification
            if (_isVerified) ...[
              TextField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'Enter your new password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your new password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNewPassword,
                child: Text('Save Password'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
