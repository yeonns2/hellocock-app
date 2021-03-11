import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/policy/payment_policy/payment_policy_screen.dart';
import 'package:hellocock/screens/policy/pickup_policy/pickup_policy_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_svg/svg.dart';

class Payment extends StatefulWidget {
  final DocumentSnapshot cart;
  final int _totalprice;
  Payment(this.cart, this._totalprice);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool food = false;
  bool value_all = false;
  bool value1 = false;
  bool value2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.cart['food'].toList() == [])
      food = false;
    else
      food = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "결제 진행",
          textScaleFactor: 1,
          style: TextStyle(
              color: kActiveColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        VerticalSpacing(
          of: 30,
        ),
        Text(
          "주문 금액",
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 17, color: kBodyTextColor, fontWeight: FontWeight.bold),
        ),
        VerticalSpacing(
          of: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                widget.cart['cocktail']['name'] +
                    " 키트 " +
                    widget.cart['cocktail']['quantity'].toString() +
                    "개",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 15,
                    color: kBodyTextColor,
                    fontWeight: FontWeight.w500)),
            Text(
              (widget.cart['cocktail']['price'] *
                          widget.cart['cocktail']['quantity'])
                      .toString() +
                  "원",
              textScaleFactor: 1,
              style: TextStyle(
                  color: Color(0xFFFF4D4D), fontWeight: FontWeight.w500),
            )
          ],
        ),
        ListView.builder(
          itemCount:
              widget.cart['food'] == null ? 0 : widget.cart['food'].length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                VerticalSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        widget.cart['food'][index]['name'] +
                            " " +
                            widget.cart['food'][index]['quantity'].toString() +
                            "개",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBodyTextColor,
                            fontWeight: FontWeight.w500)),
                    Text(
                      (widget.cart['food'][index]['price'] *
                                  widget.cart['food'][index]['quantity'])
                              .toString() +
                          "원",
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: Color(0xFFFF4D4D),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            );
          },
        ),
        VerticalSpacing(),
        Divider(
          thickness: 1.5,
          color: kBodyTextColor,
        ),
        VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("총 결제 금액",
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kBodyTextColor)),
            Text(
              widget._totalprice.toString() + "원",
              textScaleFactor: 1,
              style: TextStyle(
                  color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold),
            )
          ],
        ),
        VerticalSpacing(of: 15),
        Text(
          "위 내용을 확인하였으며 결제에 동의합니다.",
          textScaleFactor: 1,
          style: TextStyle(fontSize: 12, color: kBodyTextColor),
        ),
        VerticalSpacing(
          of: 30,
        )
      ],
    );
  }
}
