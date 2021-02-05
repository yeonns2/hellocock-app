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
              "1:1 문의",
              textScaleFactor: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          VerticalSpacing(of: 70),
          Container(
            width: 275,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              border: Border.all(
                color: kActiveColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      '''전화 문의 | 평일 pm15:00 ~ am12:00
문의사항이 있으면 연락해 주세요!''',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13, color: kBodyTextColor, height: 2),
                    ),
                  ),
                ),
                Divider(
                  color: kActiveColor,
                  thickness: 1,
                ),
                VerticalSpacing(),
                Text("전화 문의",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: kBodyTextColor,
                    )),
                VerticalSpacing(),
              ],
            ),
          ),
          VerticalSpacing(
            of: 50,
          ),
          Container(
            width: 275,
            height: 185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              border: Border.all(
                color: kActiveColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "의견 보내기 | 평일 pm15:00 ~ am12:00\n추가 되었으면 하는 칵테일이나 불편사항을 \n말씀해주세요!",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13, color: kBodyTextColor, height: 2),
                    ),
                  ),
                ),
                Divider(
                  color: kActiveColor,
                  thickness: 1,
                ),
                VerticalSpacing(),
                Text(
                  "카카오톡 플러스 친구",
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 14, color: kBodyTextColor),
                ),
                VerticalSpacing(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
