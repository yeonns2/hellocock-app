import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/order_completed/order_completed_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final DocumentSnapshot cart;
  Body(this.cart);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _totalprice = 0;
  bool food = false;
  bool value_all = false;
  bool value1 = false;
  bool value2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _totalprice =
        widget.cart['cocktail']['price'] * widget.cart['cocktail']['quantity'];
    for (int i = 0; i < widget.cart['food'].length; i++) {
      _totalprice +=
          (widget.cart['food'][i]['price'] * widget.cart['food'][i]['quantity'])
              .toInt();
    }
    if (widget.cart['food'].toList() == [])
      food = false;
    else
      food = true;
  }

  @override
  Widget build(BuildContext context) {
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
                    "결제 진행",
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: kActiveColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(
                    of: 30,
                  ),
                  Text(
                    "주문 금액",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 17,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
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
                            color: Color(0xFFFA195A),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  ListView.builder(
                    itemCount: widget.cart['food'] == null
                        ? 0
                        : widget.cart['food'].length,
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
                                      widget.cart['food'][index]['quantity']
                                          .toString() +
                                      "개",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: kBodyTextColor,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                (widget.cart['food'][index]['price'] *
                                            widget.cart['food'][index]
                                                ['quantity'])
                                        .toString() +
                                    "원",
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Color(0xFFFA195A),
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
                        _totalprice.toString() + "원",
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: Color(0xFFFA195A),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  VerticalSpacing(of: 15),
                  Text(
                    "위 내용을 확인하였으며 결제에 동의합니다.",
                    textScaleFactor: 1,
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                  VerticalSpacing(of: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value_all,
                          onChanged: (bool value) {
                            setState(() {
                              value_all = !value_all;
                              if (value_all = true) {
                                value1 = true;
                                value2 = true;
                              }
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " 모든 약관 동의",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kBodyTextColor),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.5,
                    color: kBodyTextColor,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value1,
                          onChanged: (bool value) {
                            setState(() {
                              value1 = !value1;
                              if (value1 == false) value_all = false;
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " [필수] 술픽업 이용약관",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 13, color: kBodyTextColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value2,
                          onChanged: (bool value) {
                            setState(() {
                              value2 = !value2;
                              if (value2 == false) value_all = false;
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " [필수] 청약철회방침",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 13, color: kBodyTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                press: () {
                  FirebaseFirestore.instance
                      .collection("order")
                      .doc(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    'number': DateTime.now().millisecondsSinceEpoch,
                    'name': widget.cart['name'],
                    'email': widget.cart.id,
                    'date': Timestamp.now(),
                    'total_price': _totalprice,
                    'pickup_time': widget.cart['pickup_time'],
                    'pickup_store': widget.cart['store'],
                    'pickedup': false,
                    'cocktail': widget.cart['cocktail']
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderCompletedScreen(widget.cart),
                    ),
                  );
                },
                text: _totalprice.toString() + "원 결제하기",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
