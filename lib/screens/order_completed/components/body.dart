import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/root.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  final DocumentSnapshot document;
  Body(this.document);
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
                "주문 완료",
                textScaleFactor: 1,
                style: TextStyle(
                    color: kActiveColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                of: 50,
              ),
              Text(
                "블루 하와이 칵테일 키트",
                textScaleFactor: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor,
                  fontSize: 15,
                ),
              ),
              VerticalSpacing(of: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "주문일시",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "2020/12/05 pm19:45",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: kBodyTextColor,
                    ),
                  )
                ],
              ),
              VerticalSpacing(of: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "주문번호",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "B0D051135",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: kBodyTextColor,
                    ),
                  )
                ],
              ),
              VerticalSpacing(of: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "픽업장소",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "궤도에 오르다",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: kBodyTextColor,
                    ),
                  )
                ],
              ),
              VerticalSpacing(of: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "픽업시간",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "pm20:30",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: kBodyTextColor,
                    ),
                  )
                ],
              ),
              VerticalSpacing(
                of: 30,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset("assets/images/identification.png"),
                ),
              ),
              VerticalSpacing(of: 10),
              Center(
                child: Text(
                  "가게가 혼잡할 수 있으니 신분증을 미리 준비해주세요!",
                  textScaleFactor: 1,
                  style: TextStyle(fontSize: 12, color: kBodyTextColor),
                ),
              ),
              VerticalSpacing(
                of: 120,
              ),
              PrimaryButton(
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RootPage(),
                  ),
                ),
                text: "홈으로 돌아가기",
              ),
              VerticalSpacing(
                of: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
