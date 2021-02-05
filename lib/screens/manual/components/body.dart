import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: 35,
            color: kActiveColor,
            child: Center(
                child: Text(
              "이용 방법",
              textScaleFactor: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          VerticalSpacing(of: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "step1.  먹고 싶은 칵테일 고르기",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
              VerticalSpacing(of: 30),
              Text(
                "step2.  음식점과 시간 선택하고\n               칵테일 주문하기",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
              VerticalSpacing(of: 30),
              Text(
                "step3.  집가는 길 음식점에서\n               칵테일 키트 데려가기",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
              VerticalSpacing(of: 30),
              Text(
                "step4.  칵테일 만들기",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
              VerticalSpacing(of: 30),
              Text(
                "step5.  직접 만든 칵테일과\n               함께 하루 마무리하기",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
