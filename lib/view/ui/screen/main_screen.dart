import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }
}