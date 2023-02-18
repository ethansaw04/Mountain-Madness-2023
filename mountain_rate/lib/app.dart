import 'package:flutter/material.dart';
import 'package:mountain_rate/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'How Mountain is That Mountain?', home: SplashScreen());
  }
}
