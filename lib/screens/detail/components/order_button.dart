import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/certification/certification_screen.dart';

import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/map/map_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/widgets/alert.dart';

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

    if (widget.user != null)
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
        onPressed: () async {
          if (widget.user == null) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return LoginAlert();
                });
          } else {
            setState(() {
              FirebaseFirestore.instance
                  .collection("user")
                  .doc(widget.user.email)
                  .get()
                  .then((DocumentSnapshot ds) {
                _certificated = ds['certificated'];
                print(_certificated);
              });
            });
            await Future.delayed(Duration(seconds: 1));
            if (_certificated == false) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: Text(
                        "[주류의 통신판매에 관한 명령위임고시]에 따라 본인인증을 한 회원들에게만 판매하고 있습니다. 본인 인증을 먼저 해주세요.",
                        style: TextStyle(fontSize: 13, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: Text(
                              '다음에 할래요',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        new CupertinoDialogAction(
                            child: Text(
                              '본인 인증하기',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CertificationScreen(widget.user),
                                  ));
                            }),
                      ],
                    );
                  });
            } else {
              FirebaseFirestore.instance
                  .collection("cart")
                  .doc(widget.user.email)
                  .set({
                'name': widget.user.displayName,
                'cocktail': {
                  'name': widget.document['name'],
                  'price': widget.document['price'],
                  'quantity': 1
                },
                'food': FieldValue.arrayUnion([])
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MapScreen(widget.user, widget.document),
                  ));
            }
          }
        });
  }
}
