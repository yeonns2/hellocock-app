import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen(this.user);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(widget.user),
    );
  }
}
