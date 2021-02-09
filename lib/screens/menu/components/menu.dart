import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class MenuCard extends StatefulWidget {
  final DocumentSnapshot ds;
  final int index;

  MenuCard(this.ds, this.index);
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
              widget.ds['food'][widget.index]['image'],
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
                widget.ds['food'][widget.index]['name'],
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
                        widget.ds['food'][widget.index]['price'].toString() +
                            "원",
                        style: TextStyle(
                            fontSize: 12,
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
                      width: 80,
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
}
