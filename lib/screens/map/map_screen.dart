import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';

import 'components/body.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: Text("hellocock", style: TextStyle(color: kActiveColor)),
    );
  }
}
