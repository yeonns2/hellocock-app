import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/menu/components/menu.dart';
import 'package:hellocock/screens/order/order_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  Body(this.user, this.cocktaildocument, this.storedocument);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //List<dynamic> _foodlist = List<dynamic>.from(widget.storedocument['food']);
  DateTime _chosenDateTime =
      DateTime.now().add(Duration(minutes: 30 - DateTime.now().minute % 30));
  int count = 0;

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
                        mode: CupertinoDatePickerMode.dateAndTime,
                        minuteInterval: 30,
                        minimumDate: DateTime.now(),
                        maximumDate: DateTime.now().add(Duration(hours: 6)),
                        use24hFormat: true,
                        initialDateTime: DateTime.now().add(
                            Duration(minutes: 30 - DateTime.now().minute % 30)),
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              widget.storedocument['image'],
                              height: 140,
                              width: 140,
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
                                    fontSize: 15,
                                    color: kBodyTextColor),
                              ),
                              Text(
                                widget.storedocument['explain']
                                    .replaceAll("\\n", "\n"),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: kBodyTextColor,
                                    height: 1.3),
                              ),
                              Text(
                                widget.storedocument['opening_hours'],
                                style: TextStyle(
                                    fontSize: 13, color: kBodyTextColor),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 83,
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text(
                                        _chosenDateTime.hour.toString() +
                                            ":" +
                                            _chosenDateTime.minute.toString(),
                                        style: TextStyle(
                                            fontSize: 11,
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
                                          builder: (context) => OrderScreen(
                                            widget.user,
                                            widget.cocktaildocument,
                                            widget.storedocument,
                                            chosenDateTime: _chosenDateTime,
                                          ),
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
                      fontSize: 17.0,
                      color: kActiveColor),
                ),
                VerticalSpacing(of: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuCard(widget.storedocument, index);
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
