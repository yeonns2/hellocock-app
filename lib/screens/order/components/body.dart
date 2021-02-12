import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellocock/screens/order_completed/order_completed_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  final DateTime chosenDateTime;

  Body(this.user, this.cocktaildocument, this.storedocument,
      {this.chosenDateTime});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _chosenDateTime;
  var _totalprice = 0;
  int count = 1;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    _totalprice += widget.cocktaildocument['price'];
    if (widget.chosenDateTime != null)
      _chosenDateTime = widget.chosenDateTime;
    else
      _chosenDateTime = DateTime.now()
          .add(Duration(minutes: 30 - DateTime.now().minute % 30));
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(37.54658, 127.07564)));
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
                  Text(widget.cocktaildocument['name'] + " 칵테일 키트",
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: kBodyTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(
                    _totalprice.toString() + "원",
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
                                  _totalprice -=
                                      widget.cocktaildocument['price'];
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
                              _totalprice += widget.cocktaildocument['price'];
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
              Text(
                "수령 정보 확인",
                textScaleFactor: 1,
                style: TextStyle(
                    color: kActiveColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                of: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "수령인",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.user.displayName,
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )
                ],
              ),
              VerticalSpacing(of: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "수령시간",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/icons/arrow_dropdown.svg"),
                          Text(
                            _chosenDateTime.hour.toString() +
                                ":" +
                                _chosenDateTime.minute.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      onPressed: () => _showDatePicker(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              VerticalSpacing(of: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "수령지",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBodyTextColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.storedocument['name'],
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )
                ],
              ),
              VerticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.storedocument['address'].replaceAll("\\n", '\n'),
                    textAlign: TextAlign.end,
                    style: TextStyle(color: kBodyTextColor, fontSize: 12),
                  ),
                ],
              ),
              VerticalSpacing(of: 30),
              Container(
                width: 300,
                height: 300,
                child: Opacity(
                  opacity: 0.8,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(37.54658, 127.07564), zoom: 16),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: Set.from(allMarkers),
                    myLocationButtonEnabled: false,
                  ),
                ),
              ),
              VerticalSpacing(
                of: 50,
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
                        color: Color(0xFFFF4D4D), fontWeight: FontWeight.w500),
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
                        color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalSpacing(of: 30),
              Text(
                "위 내용을 확인하였으며 결제에 동의합니다.",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 13),
              ),
              VerticalSpacing(of: 50),
              PrimaryButton(
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                },
                text: "결제하기",
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
