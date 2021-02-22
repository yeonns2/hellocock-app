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
                "결제금액",
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
                  Text("주문금액",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: kBodyTextColor,
                          fontWeight: FontWeight.w500)),
                  Text(
                    _totalprice.toString() + "원",
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: Color(0xFFFA195A), fontWeight: FontWeight.w500),
                  )
                ],
              ),
              VerticalSpacing(of: 5),
              Divider(
                thickness: 1.5,
                color: kBodyTextColor,
              ),
              VerticalSpacing(of: 5),
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
                        color: Color(0xFFFA195A), fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalSpacing(of: 30),
              Text(
                "위 내용을 확인하였으며 결제에 동의합니다.",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 13),
              ),
              VerticalSpacing(of: 480),
              PrimaryButton(
                press: () {
                  FirebaseFirestore.instance.collection("order").doc().set({
                    'number': "",
                    'name': widget.cart['name'],
                    'email': widget.cart.id,
                    'date': Timestamp.now(),
                    'total_price': 14000,
                    'pickup_time': "",
                    'pickup_store': widget.cart['name'],
                    'pickedup': false,
                    'product': FieldValue.arrayUnion([widget.cart['cocktail']])
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderCompletedScreen(),
                    ),
                  );
                },
                text: _totalprice.toString() + "원 결제하기",
              ),
              VerticalSpacing(
                of: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
