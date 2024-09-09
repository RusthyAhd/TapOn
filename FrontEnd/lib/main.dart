import 'package:flutter/material.dart';
import 'package:tap_on/Enter%20phone%20numper%20page.dart';
import 'package:tap_on/constants.dart';
import 'package:tap_on/laungh%20page.dart';

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
    return MaterialApp(
      home: TapOnApp(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
