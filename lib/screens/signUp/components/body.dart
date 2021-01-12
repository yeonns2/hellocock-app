import 'package:flutter/material.dart';

import 'package:hellocock/size_config.dart';

import '../../../constants.dart';

import 'sign_up_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                " 회원가입",
                style: TextStyle(
                    color: kActiveColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                of: 30,
              ),

              SignUpForm(),
              VerticalSpacing(
                of: 50,
              ),
              // SocialButton(
              //   color: Color(0xFFFFD834),
              //   text: "카카오 이메일로 회원가입하기",
              //   press: () {},
              // ),
              // VerticalSpacing(),
              // SocialButton(
              //   color: Color(0xFF507FFF),
              //   text: "페이스북 이메일로 회원가입하기",
              //   press: () {},
              // ),
              // VerticalSpacing(),
              // SocialButton(
              //   color: Colors.white,
              //   text: "구글 이메일로 회원가입하기",
              //   press: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
