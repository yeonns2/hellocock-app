import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/size_config.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              "assets/icons/mycock.svg",
            ),
          ),
          VerticalSpacing(
            of: 20,
          ),
          Text(
            "로그인이 필요한 서비스 입니다.",
            style: TextStyle(
                fontSize: 13,
                color: kBodyTextColor,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(
            "안할래요",
            style: TextStyle(color: kActiveColor),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        new FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          },
          child: new Text(
            "로그인하기",
            style: TextStyle(color: kActiveColor),
          ),
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
