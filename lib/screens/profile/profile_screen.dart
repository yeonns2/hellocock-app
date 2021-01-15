import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(user),
    );
  }
}
