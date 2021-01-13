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
                "step1. 먹고 싶은 칵테일을 \n             고른다",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step2. 칵테일 키트를 집가는\n             길에 있는 음식점으로\n             주문한다.",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step3. 집에 가면서 주문한 \n              칵테일을 가지고\n              집으로 간다.",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 40),
              Text(
                "step4. 집에서 칵테일을 \n              만들어 먹으며\n              하루를 마무리한다.",
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
