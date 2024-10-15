import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/User_Home/EnterNumber.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  // List of TextEditingControllers for the 6 text fields
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  // List of FocusNodes for the 6 text fields
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    // Dispose the controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC342),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter SMS Code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: '', // Removes character counter
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        // Move to the next field if the current one is filled
                        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        // Move to the previous field if the current one is cleared
                        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnterNumber()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                  child: const Text('Resend Code'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                  child: const Text('Confirm'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'You should receive the code shortly',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
