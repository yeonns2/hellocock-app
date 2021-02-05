import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/certification/certification_screen.dart';
import 'package:hellocock/widgets/alert.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/map/map_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderButton extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;
  OrderButton(this.user, this.document);
  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _certificated;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(widget.user.email)
        .get()
        .then((DocumentSnapshot ds) {
      _certificated = ds['certificated'];
      print(_certificated);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        height: 60,
        minWidth: SizeConfig.screenWidth - 130,
        child: Row(
          children: [
            SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  "assets/icons/logo.svg",
                  fit: BoxFit.fitWidth,
                )),
            HorizontalSpacing(
              of: 5,
            ),
            Text(
              "주문하기",
              textScaleFactor: 1,
              style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.6),
            ),
          ],
        ),
        color: kActiveColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        onPressed: () {
          if (_certificated == false) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Text(
                      "성인 인증이 필요합니다. \n성인인증을 먼저 해주세요.",
                      style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      new CupertinoDialogAction(
                          child: Text(
                            '성인 인증하러 가기',
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CertificationScreen(widget.user),
                                ));
                          }),
                      new CupertinoDialogAction(
                          child: Text(
                            '다음에 할래요',
                            style: TextStyle(fontSize: 13),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  );
                });
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(widget.user, widget.document),
                ));
          }
        });
  }
}
