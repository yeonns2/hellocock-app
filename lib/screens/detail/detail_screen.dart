import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: Text("hellocock", style: TextStyle(color: kActiveColor)),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.menu,
            color: kActiveColor,
          ),
        ),
      ],
    );
  }
}
