import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/modify/modify.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final User user;
  Body(this.user);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VerticalSpacing(of: 40),
                    Text(
                      "이름",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kBodyTextColor),
                    ),
                    VerticalSpacing(),
                    TextFormField(
                      initialValue: widget.user.displayName,
                      style: TextStyle(fontSize: 14, color: kBodyTextColor),
                      keyboardType: TextInputType.name,
                      readOnly: true,
                      cursorColor: kActiveColor,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    Text(
                      "이메일",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kBodyTextColor),
                    ),
                    VerticalSpacing(),
                    TextFormField(
                      initialValue: widget.user.email,
                      style: TextStyle(fontSize: 14, color: kBodyTextColor),
                      keyboardType: TextInputType.name,
                      readOnly: true,
                      cursorColor: kActiveColor,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                    VerticalSpacing(
                      of: 30,
                    ),
                    Text(
                      "핸드폰",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kBodyTextColor),
                    ),
                    VerticalSpacing(),
                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("user")
                            .doc(widget.user.email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();
                          return TextFormField(
                            initialValue: snapshot.data['phone'] ?? "",
                            style:
                                TextStyle(fontSize: 14, color: kBodyTextColor),
                            keyboardType: TextInputType.name,
                            readOnly: true,
                            cursorColor: kActiveColor,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          );
                        }),
                    VerticalSpacing(
                      of: 30,
                    ),
                    Text(
                      "주소",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kBodyTextColor),
                    ),
                    VerticalSpacing(),
                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("user")
                            .doc(widget.user.email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();
                          return TextFormField(
                            initialValue: snapshot.data['address1'] ?? "",
                            style:
                                TextStyle(fontSize: 14, color: kBodyTextColor),
                            keyboardType: TextInputType.name,
                            readOnly: true,
                            cursorColor: kActiveColor,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          );
                        }),
                    VerticalSpacing(),
                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("user")
                            .doc(widget.user.email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();
                          return TextFormField(
                            initialValue: snapshot.data['address2'] ?? "",
                            style:
                                TextStyle(fontSize: 14, color: kBodyTextColor),
                            keyboardType: TextInputType.name,
                            readOnly: true,
                            cursorColor: kActiveColor,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          );
                        }),
                    VerticalSpacing(
                      of: 150,
                    ),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                text: "정보 수정하기",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModifyScreen(widget.user),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
