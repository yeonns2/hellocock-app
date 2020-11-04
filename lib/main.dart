import 'package:flutter/material.dart';
import 'package:hellocock/screens/splash/splash_screen.dart';
import 'package:hellocock/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hellocock app',
      theme: buildThemeData(),
      home: SplashScreen(),
    );
  }
}
