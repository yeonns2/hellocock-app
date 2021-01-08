import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hellocock/screens/intro/intro_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset('assets/images/splash.svg'),
    );
  }
}
