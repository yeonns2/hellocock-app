import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class MenuCard extends StatefulWidget {
  final DocumentSnapshot store;
  final int index;
  final User user;

  MenuCard(this.store, this.index, this.user);
  //final Widget image;

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              widget.store['food'][widget.index]['image'],
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
                widget.store['food'][widget.index]['name'],
                textScaleFactor: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: kBodyTextColor),
              ),
              Text(
                "소시지, 양파, 피클, 케첩, 머스타드",
                textScaleFactor: 1,
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
                        widget.store['food'][widget.index]['price'].toString() +
                            "원",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFA195F)),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2.0,
                    child: Container(
                      width: 90,
                      height: 30,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 35,
                              child: FlatButton(
                                  onPressed: () {
                                    if (count > 0) {
                                      setState(() {
                                        count -= 1;
                                        _addfood();
                                      });
                                    }
                                  },
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: kBodyTextColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Text(
                              "$count",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kBodyTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 35,
                              child: FlatButton(
                                  onPressed: () {
                                    count += 1;
                                    _addfood();
                                    setState(() {});
                                  },
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: kBodyTextColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ]),
      ]),
    );
  }

  void _addfood() async {
    var data;

    FirebaseFirestore.instance
        .collection('cart')
        .doc(widget.user.email)
        .get()
        .then((DocumentSnapshot ds) {
      data = ds['food'];
    });
    await Future.delayed(Duration(seconds: 1));

    final List food = List<Map>.from(data ?? []);
    final updateData = {
      'name': widget.store['food'][widget.index]['name'],
      'price': widget.store['food'][widget.index]['price'],
      'quantity': count
    };

    food.add(updateData);
    FirebaseFirestore.instance
        .collection("cart")
        .doc(widget.user.email)
        .update({'food': food, 'store': widget.store['name']});
  }
}
