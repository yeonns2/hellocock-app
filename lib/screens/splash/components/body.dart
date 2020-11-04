import 'package:flutter/material.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';

import '../../../constants.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/dot_indicators.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: PageView.builder(
              itemCount: demoData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => OnboardContent(
                illustration: demoData[index]["illustration"],
                title: demoData[index]["title"],
                text: demoData[index]["text"],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(demoData.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: PrimaryButton(
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              ),
              text: "시작하기",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/icons/logo1.png",
    "title": "더 재밌게",
    "text": "오늘은 내가 주인공",
  },
  {
    "illustration": "assets/icons/logo1.png",
    "title": "더 다양하게",
    "text": "당신을 위로하는 단 하나의 칵테일",
  },
  {
    "illustration": "assets/icons/logo1.png",
    "title": "더 편하게",
    "text": "제발 소주 좀 그만 마시자",
  },
];
