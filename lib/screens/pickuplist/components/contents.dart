import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class PickUpCard extends StatelessWidget {
  final DocumentSnapshot order;
  PickUpCard(this.order);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 275,
          height: 175,
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
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20.0, right: 20),
                  child: Text(
                    order['cocktail']['name'] + " 칵테일 키트",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 15,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: kActiveColor,
                  thickness: 1,
                ),
                VerticalSpacing(
                  of: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "주문일시",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('yyyy/MM/dd')
                                .format(order['date'].toDate()),
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                    VerticalSpacing(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "주문번호",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            order['number'].toString(),
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                    VerticalSpacing(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "픽업장소",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            order['pickup_store'],
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                    VerticalSpacing(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "픽업시간",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.jm()
                                .format(order['pickup_time'].toDate()),
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: kBodyTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ]),
                ),
              ]),
        ),
      ],
    );
  }
}
