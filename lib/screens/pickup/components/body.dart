import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellocock/screens/payment/payment_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/size_config.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot cart;
  final DocumentSnapshot store;
  Body(this.user, this.cart, this.store);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _chosenDateTime;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();

    if (widget.cart['pickup_time'] != null)
      _chosenDateTime = widget.cart['pickup_time'].toDate();
    else {
      _chosenDateTime = new DateTime(now.year, now.month, now.day, 18, 00);
    }
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
                    widget.cart['name'],
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
                            DateFormat('HH:mm').format(_chosenDateTime),
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
                    widget.store['name'],
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
                    widget.store['address'].replaceAll("\\n", '\n'),
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
                of: 140,
              ),
              PrimaryButton(
                press: () {
                  FirebaseFirestore.instance
                      .collection('cart')
                      .doc(widget.user.email)
                      .update({'pickup_time': _chosenDateTime});

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentScreen(widget.cart)));
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
