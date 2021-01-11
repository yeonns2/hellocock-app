import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';

import '../../constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.menu,
          color: kActiveColor,
        ),
      ),
      title: Text("hellocock",
          style: TextStyle(color: kActiveColor, fontFamily: 'NotoSans')),
    );
  }
}
