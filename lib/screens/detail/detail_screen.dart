import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

import 'components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  final User user;
  final int index;

  DetailScreen(this.user, this.index);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(user, index),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
    );
  }
}
