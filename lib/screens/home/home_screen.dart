import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/mycock/mycock_screen.dart';
import 'package:hellocock/screens/profile/profile_screen.dart';

import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
