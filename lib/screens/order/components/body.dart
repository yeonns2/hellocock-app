import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/pickup/pickup_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  final DocumentSnapshot cart;
  final DocumentSnapshot store;

  Body(
    this.cart,
    this.store,
  );

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int count = 1;
  bool containfood;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.cart['food'] != null)
      containfood = true;
    else
      containfood = false;
  }

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
              VerticalSpacing(),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                elevation: 2.0,
                child: Container(
                  width: 275,
                  height: 38,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              if (count > 0) {
                                setState(() {
                                  widget.cart['cocktail']['price'] -=
                                      widget.cart['cocktail']['price'];
                                  count -= 1;
                                });
                              }
                            },
                            child: Text(
                              '-',
                              style: TextStyle(
                                  color: kBodyTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "$count",
                          style: TextStyle(
                              color: kBodyTextColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        FlatButton(
                            onPressed: () {
                              widget.cart['cocktail']['price'] +=
                                  widget.cart['cocktail']['price'];
                              count += 1;
                              setState(() {});
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  color: kBodyTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )),
                      ]),
                ),
              ),
              VerticalSpacing(
                of: 30,
              ),
              containfood
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        VerticalSpacing(of: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.cart['food'][0]['name'],
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: kBodyTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              widget.cart['food'][0]['price'].toString() + "원",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: Color(0xFFFF4D4D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        VerticalSpacing(),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          elevation: 2.0,
                          child: Container(
                            width: 275,
                            height: 38,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      onPressed: () {
                                        if (count > 0) {
                                          setState(() {});
                                        }
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            color: kBodyTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Text(
                                    widget.cart['food'][0]['quantity']
                                        .toString(),
                                    style: TextStyle(
                                        color: kBodyTextColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            color: kBodyTextColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ]),
                          ),
                        ),
                        VerticalSpacing(
                          of: 30,
                        ),
                      ],
                    )
                  : VerticalSpacing(
                      of: 150,
                    ),
              VerticalSpacing(of: 330),
              PrimaryButton(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PickUpScreen(widget.cart, widget.store)));
                },
                text: "확인완료",
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
