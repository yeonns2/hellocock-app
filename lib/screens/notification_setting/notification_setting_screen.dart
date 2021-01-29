import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 35,
          color: kActiveColor,
          child: Center(
              child: Text(
            "알림 설정",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        Body(),
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
