import 'package:flutter/material.dart';
import 'package:hellocock/screens/root.dart';
import 'package:hellocock/size_config.dart';
import '../../../constants.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/dot_indicators.dart';
import 'content.dart';

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
            flex: 15,
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
          Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(demoData.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 1),
          currentPage == 3
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: PrimaryButton(
                    press: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RootPage(),
                      ),
                    ),
                    text: "시작하기",
                  ),
                )
              : VerticalSpacing(
                  of: 48,
                ),
          VerticalSpacing(
            of: 50,
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> demoData = [
  {
    "illustration":
        "https://firebasestorage.googleapis.com/v0/b/hellocock-6b1dd.appspot.com/o/images%2Fintro1.png?alt=media&token=99069cd0-489e-4cef-8983-a4274610880f",
    "title": "달콤하게 취하고 싶은 오늘밤",
    "text": "내일이 두려운 소주말고 \n 배부른 맥주말고 달콤하게 취해요",
  },
  {
    "illustration":
        "https://firebasestorage.googleapis.com/v0/b/hellocock-6b1dd.appspot.com/o/images%2Fintro2.png?alt=media&token=7c6f472e-6699-4fa9-a486-8cfc331fc93b",
    "title": "집에서 한 잔으로 즐기는 칵테일",
    "text": "전문 칵테일바가 아닌 내 집에서 \n 마실 수 있는 칵테일 한 잔",
  },
  {
    "illustration":
        "https://firebasestorage.googleapis.com/v0/b/hellocock-6b1dd.appspot.com/o/images%2Fintro3.png?alt=media&token=5bee3568-0b90-4937-a636-2dcf494a7dea",
    "title": "돌아가는 길, 데려가는 칵테일",
    "text": "집에 가기 전 스마트 오더 서비스로 \n 미리 주문하는 칵테일 키트",
  },
  {
    "illustration": "assets/icons/logo1.svg",
    "title": "",
    "text": "",
  },
];
