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
            children: List.generate(
                demoData.length,
                (index) => DotIndicator(
                      isActive: index == currentPage,
                    )),
          ),
          Spacer(flex: 1),
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
    "title": "빠르게 주문, 빠르게 픽업 ",
    "text": "집에 가기 전 스마트 오더 서비스로 \n 미리 주문하는 서비스",
  },
  {
    "illustration": "assets/icons/logo1.png",
    "title": "달콤하게 취하고 싶은 오늘밤",
    "text": "내일이 두려운 소주말고 \n 배부른 맥주말고 달콤하게 취해요",
  },
  {
    "illustration": "assets/icons/logo1.png",
    "title": "집에서 한 잔으로 즐기는 칵테일",
    "text": "전문 칵테일바가 아닌 내 집에서 \n 마실 수 있는 칵테일 한 잔",
  },
];
