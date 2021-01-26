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
                "step1. 먹고 싶은 칵테일을 \n             고르기",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step2. 음식점과 시간 선택하고\n             칵테일 주문하기",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step3. 집가는 길 음식점에서\n              칵테일을 데려가기",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step4. 칵테일 만들기",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step5. 직접 만든 칵테일과\n              함께 하루 마무리하기",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
