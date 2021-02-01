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
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " 픽업 장소 및 시간",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: kActiveColor),
                ),
                VerticalSpacing(of: 20),
                Container(
                  height: 140,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              widget.storedocument['image'],
                              height: 131,
                              width: 131,
                              fit: BoxFit.fitWidth,
                            )),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.storedocument['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                widget.storedocument['explain']
                                    .replaceAll("\\n", "\n"),
                                style: TextStyle(
                                    fontSize: 11,
                                    color: kBodyTextColor,
                                    height: 1.3),
                              ),
                              Text(
                                widget.storedocument['opening_hours'],
                                style: TextStyle(
                                    fontSize: 11, color: kBodyTextColor),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 83,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        "20:00",
                                        style: TextStyle(
                                            fontSize: 11,
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
                                    width: 83,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        "수령하기",
                                        style: TextStyle(
                                            fontSize: 11,
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
                Text(
                  "추천 메뉴",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: kActiveColor),
                ),
                VerticalSpacing(of: 10),
                Container(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/menu.jpeg',
                              height: 82,
                              width: 123,
                              fit: BoxFit.fitWidth,
                            )),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "아트모 핫도그 단품", //widget.storedocument['food'][0].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                "소시지, 양파, 피클, 케첩, 머스타드",
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 12,
                                      ),
                                      child: Text(
                                        " 4200원",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFA195F)),
                                      ),
                                    ),
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
                Container(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/menu.jpeg',
                              height: 82,
                              width: 123,
                              fit: BoxFit.fitWidth,
                            )),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "아트모 핫도그 단품", //widget.storedocument['food'][0].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                "소시지, 양파, 피클, 케첩, 머스타드",
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 12,
                                      ),
                                      child: Text(
                                        " 4200원",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFA195F)),
                                      ),
                                    ),
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
                Container(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/menu.jpeg',
                              height: 82,
                              width: 123,
                              fit: BoxFit.fitWidth,
                            )),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "아트모 핫도그 단품", //widget.storedocument['food'][0].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                "소시지, 양파, 피클, 케첩, 머스타드",
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 12,
                                      ),
                                      child: Text(
                                        " 4200원",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFA195F)),
                                      ),
                                    ),
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
                Container(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              'assets/images/menu.jpeg',
                              height: 82,
                              width: 123,
                              fit: BoxFit.fitWidth,
                            )),
                        HorizontalSpacing(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "아트모 핫도그 단품", //widget.storedocument['food'][0].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                "소시지, 양파, 피클, 케첩, 머스타드",
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 12,
                                      ),
                                      child: Text(
                                        " 4200원",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFA195F)),
                                      ),
                                    ),
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
