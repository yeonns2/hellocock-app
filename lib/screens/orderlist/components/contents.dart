import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20.0),
            child: Text(
              "블루 하와이 칵테일 키트",
              style: TextStyle(
                  fontSize: 13,
                  color: kBodyTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          VerticalSpacing(of: 5),
          Divider(
            color: kActiveColor,
            thickness: 1,
          ),
          VerticalSpacing(
            of: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "주문일시",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2020/12/05 pm19:45",
                    style: TextStyle(fontSize: 13, color: kBodyTextColor),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "주문번호",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "B0D051135",
                    style: TextStyle(fontSize: 13, color: kBodyTextColor),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "픽업장소",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "궤도에 오르다",
                    style: TextStyle(fontSize: 13, color: kBodyTextColor),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "픽업시간",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "pm20:30",
                    style: TextStyle(fontSize: 13, color: kBodyTextColor),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
