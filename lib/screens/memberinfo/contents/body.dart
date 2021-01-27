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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalSpacing(of: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "이름",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kBodyTextColor),
                  ),
                ),
                TextFormField(
                  initialValue: widget.user.displayName,
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.name,
                  readOnly: true,
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                VerticalSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "이메일",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kBodyTextColor),
                  ),
                ),
                TextFormField(
                  initialValue: widget.user.email,
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.name,
                  readOnly: true,
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                VerticalSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "비밀번호",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kBodyTextColor),
                  ),
                ),
                TextFormField(
                  initialValue: "******",
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.name,
                  readOnly: true,
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                VerticalSpacing(
                  of: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "핸드폰",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kBodyTextColor),
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("user")
                        .doc("peachcrush@hellocock.org")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return TextFormField(
                        initialValue: snapshot.data['phone'],
                        style: TextStyle(fontSize: 13),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "주소",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kBodyTextColor),
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("user")
                        .doc("peachcrush@hellocock.org")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return TextFormField(
                        initialValue: snapshot.data['address'],
                        style: TextStyle(fontSize: 13),
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
                        .doc("peachcrush@hellocock.org")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return TextFormField(
                        initialValue: snapshot.data['address'],
                        style: TextStyle(fontSize: 13),
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
                Center(
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
              ]),
        ),
      ),
    );
  }
}
