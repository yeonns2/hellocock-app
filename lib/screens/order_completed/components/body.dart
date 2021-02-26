import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/root.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final DocumentSnapshot document;

  Body(this.document);
  @override
  Widget build(BuildContext context) {
    //var date = document['pickup_time'].toDate();
    var pickup_time = DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Stack(
          children: [
            SingleChildScrollView(
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
                    document['cocktail']['name'] + " 칵테일 키트",
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
                        pickup_time,
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
                        document['store'],
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
                        pickup_time,
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
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                press: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RootPage(),
                  ),
                ),
                text: "홈으로 돌아가기",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
