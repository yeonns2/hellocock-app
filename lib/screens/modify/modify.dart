import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'contents/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModifyScreen extends StatelessWidget {
  final User user;
  ModifyScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 35,
          color: kActiveColor,
          child: Center(
              child: Text(
            "회원정보 관리",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        Expanded(child: Body(user))
        //Body(user),
      ]),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
    );
  }
}
