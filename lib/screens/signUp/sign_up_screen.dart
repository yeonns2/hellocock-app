import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
            color: kActiveColor,
            onPressed: () => Navigator.pop(context)),
      ),
      body: Body(),
    );
  }
}
