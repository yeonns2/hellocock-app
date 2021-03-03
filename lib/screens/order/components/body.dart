import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/order/components/quantitycard.dart';
import 'package:hellocock/screens/pickup/pickup_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot cart;
  final DocumentSnapshot store;

  Body(this.user, this.cart, this.store);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool food = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cart['food'].toList().isEmpty)
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
                    "주문내역 확인",
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
                    "칵테일",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 17,
                    ),
                  ),
                  VerticalSpacing(of: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.cart['cocktail']['name'] + " 칵테일 키트",
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: kBodyTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Text(
                        widget.cart['cocktail']['price'].toString() + "원",
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: Color(0xFFFF4D4D),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  VerticalSpacing(of: 15),
                  QuantityCard(
                    quantity: widget.cart['cocktail']['quantity'],
                    onpressed1: () {
                      setState(() {
                        FirebaseFirestore.instance
                            .collection("cart")
                            .doc(widget.user.email)
                            .update(
                          {
                            'cocktail': {
                              'name': widget.cart['cocktail']['name'],
                              'price': widget.cart['cocktail']['price'] *
                                  widget.cart['cocktail']['quantity'],
                              'quantity': widget.cart['cocktail']['quantity']
                            },
                          },
                        );
                      });
                    },
                    onpressed2: () {
                      setState(() {
                        FirebaseFirestore.instance
                            .collection("cart")
                            .doc(widget.user.email)
                            .update(
                          {
                            'cocktail': {
                              'name': widget.cart['cocktail']['name'],
                              'price': widget.cart['cocktail']['price'] *
                                  widget.cart['cocktail']['quantity'],
                              'quantity': widget.cart['cocktail']['quantity']
                            },
                          },
                        );
                      });
                    },
                  ),
                  VerticalSpacing(
                    of: 30,
                  ),
                  food
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "안주",
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBodyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            VerticalSpacing(of: 30),
                            ListView.builder(
                              itemCount: widget.cart['food'] == null
                                  ? 0
                                  : widget.cart['food'].length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return foodwidget(index);
                              },
                            ),
                            VerticalSpacing(of: 30),
                          ],
                        )
                      : VerticalSpacing(of: 30),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickUpScreen(
                              widget.user, widget.cart, widget.store)));
                },
                text: "확인완료",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodwidget(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.cart['food'][index]['name'],
                textScaleFactor: 1,
                style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Text(
              widget.cart['food'][index]['price'].toString() + "원",
              textScaleFactor: 1,
              style: TextStyle(
                  color: Color(0xFFFF4D4D),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        // VerticalSpacing(),
        // Text("소시지, 양파, 피클, 케첩, 머스타드",
        //     textScaleFactor: 1,
        //     style: TextStyle(
        //       color: kBodyTextColor,
        //       fontSize: 13,
        //     )),
        VerticalSpacing(of: 15),
        QuantityCard(
          quantity: widget.cart['food'][index]['quantity'],
          onpressed1: () {},
          onpressed2: () {},
        ),
        VerticalSpacing(of: 30)
      ],
    );
  }
}
