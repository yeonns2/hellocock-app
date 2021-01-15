import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/splash_screen.dart';
import 'package:hellocock/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
