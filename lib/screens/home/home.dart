import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hellocok",
          style: TextStyle(color: kActiveColor),
        ),
      ),
    );
  }
}
