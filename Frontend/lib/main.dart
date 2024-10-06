import 'package:flutter/material.dart';
import 'package:tap_on/constants.dart';
import 'package:tap_on/Launch%20app.dart';

//

void main() {
  runApp(const InitialScreen());
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: TapOnApp(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
