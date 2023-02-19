import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Hello Home Screen!",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black
            ),
          ),
        ),
      ),  
    );
  }
}