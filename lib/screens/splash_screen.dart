import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/intro/intro_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/screens/root.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => checkFirstSeen());
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new RootPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/splash.png'),
    );
  }
}
