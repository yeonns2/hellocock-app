import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/order/order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  Body(this.cocktaildocument, this.storedocument);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //List<dynamic> _foodlist = List<dynamic>.from(widget.storedocument['food']);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "픽업 장소 및 시간",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: kActiveColor),
                  ),
                ),
                Container(
                  height: 140,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(widget.storedocument['image']),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.storedocument['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                widget.storedocument['explain']
                                    .replaceAll("\\n", "\n"),
                                style: TextStyle(fontSize: 11),
                              ),
                              Text(
                                widget.storedocument['opening_hours'],
                                style: TextStyle(fontSize: 11),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        "안주보기",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700]),
                                      ),
                                      onPressed: () {},
                                      color: Colors.white,
                                    ),
                                  ),
                                  HorizontalSpacing(
                                    of: 10,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        "수령하기",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OrderScreen(widget.storedocument),
                                        ),
                                      ),
                                      color: kActiveColor,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                ),
                VerticalSpacing(
                  of: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "추천 메뉴",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: kActiveColor),
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Image.asset(widget.storedocument['image'])),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "", //widget.storedocument['food'][0].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                widget.storedocument['opening_hours'],
                                style: TextStyle(fontSize: 11),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, top: 12, left: 5),
                                      child: Text(
                                        "4200원",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  HorizontalSpacing(
                                    of: 10,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        "수령하기",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700]),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OrderScreen(widget.storedocument),
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
