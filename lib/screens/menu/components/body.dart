import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/menu/components/menu.dart';
import 'package:hellocock/screens/order/order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot cocktail;
  final DocumentSnapshot store;
  Body(this.user, this.cocktail, this.store);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //List<dynamic> _foodlist = List<dynamic>.from(widget.storedocument['food']);
  final now = new DateTime.now();
  DateTime _chosenDateTime;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chosenDateTime = DateTime(now.year, now.month, now.day, 18, 0);

    FirebaseFirestore.instance
        .collection("cart")
        .doc(widget.user.email)
        .update({'food': []});
  }

  void _showDatePicker(context) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: MediaQuery.of(context).size.height * 0.32,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        minuteInterval: 30,
                        minimumDate:
                            DateTime(now.year, now.month, now.day, 18, 0),
                        maximumDate:
                            DateTime(now.year, now.month, now.day, 22, 0),
                        use24hFormat: true,
                        initialDateTime: _chosenDateTime,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 25, top: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "픽업 장소 및 시간",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 20),
              Container(
                height: 140,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(
                        widget.store['image'],
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      )),
                  HorizontalSpacing(),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.store['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: kBodyTextColor),
                        ),
                        Text(
                          widget.store['explain'].replaceAll("\\n", "\n"),
                          style: TextStyle(
                              fontSize: 13, color: kBodyTextColor, height: 1.3),
                        ),
                        Text(
                          widget.store['opening_hours'],
                          style: TextStyle(fontSize: 13, color: kBodyTextColor),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  DateFormat('HH:mm').format(_chosenDateTime),
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                ),
                                onPressed: () => _showDatePicker(context),
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
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("cart")
                                      .doc(widget.user.email)
                                      .update({
                                    'pickup_time': _chosenDateTime,
                                    'store': widget.store['name']
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderScreen(
                                          widget.user,
                                          widget.store,
                                        ),
                                      ));
                                },
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
                    fontSize: 17.0,
                    color: kActiveColor),
              ),
              VerticalSpacing(of: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.store['food'].length,
                itemBuilder: (BuildContext context, int index) {
                  return MenuCard(widget.store, index, widget.user);
                },
              ),
            ]),
      ),
    );
  }
}
