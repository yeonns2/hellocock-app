import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/mycock/components/contents.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('order')
                .where('email', isEqualTo: widget.user.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(kActiveColor),
                  ),
                );
              }
              if (snapshot.data.docs.length == 0) {
                return Center(
                  child: Text(
                    "마이콕은 그동안 마셨던 칵테일을 \n확인할 수 있는 나만의 bar 입니다!\n헬로콕의 칵테일 키트와 마이콕을 \n채워봐요~",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kActiveColor,
                        height: 1.5),
                  ),
                );
              }
              return Stack(
                children: [
                  Column(
                    children: [
                      VerticalSpacing(
                        of: 120,
                      ),
                      Divider(
                        thickness: 1,
                        color: kActiveColor,
                      ),
                      VerticalSpacing(
                        of: 135,
                      ),
                      Divider(
                        thickness: 1,
                        color: kActiveColor,
                      ),
                      VerticalSpacing(
                        of: 135,
                      ),
                      Divider(
                        thickness: 1,
                        color: kActiveColor,
                      ),
                      VerticalSpacing(
                        of: 135,
                      ),
                      Divider(
                        thickness: 1,
                        color: kActiveColor,
                      ),
                    ],
                  ),
                  Center(
                    child: GridView.count(
                      shrinkWrap: true, // You won't see infinite size error
                      primary: false,
                      crossAxisCount: 4,
                      childAspectRatio: 0.6,
                      padding: const EdgeInsets.only(top: 30.0),
                      crossAxisSpacing: 1,
                      children: List.generate(
                          snapshot.data.docs.length, (index) => MyCocktail()),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
