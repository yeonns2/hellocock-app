import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/pickuplist/components/contents.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  final User user;
  Body(this.user);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 10000,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('order')
                    .where('email', isEqualTo: widget.user.email)
                    .where('pickedup', isEqualTo: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(kActiveColor),
                      ),
                    );
                  }
                  if (snapshot.data.docs.length == 0) {
                    return Text(
                      "수령할 칵테일이 없어요..",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBodyTextColor,
                          height: 1.5),
                    );
                  }

                  return ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          PickUpCard(snapshot.data.docs[index]),
                          VerticalSpacing(of: 30),
                        ],
                      );
                    },
                  );
                }),
          ),
          VerticalSpacing(
            of: 50,
          ),
        ],
      ),
    );
  }
}
