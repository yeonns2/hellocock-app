import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/likelist/likelist_screen.dart';
import 'package:hellocock/screens/orderlist/orderlist_screen.dart';
import 'package:hellocock/screens/pickuplist/pickuplist_screen.dart';
import 'package:hellocock/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  final User user;
  Body(this.user);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: 250,
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HorizontalSpacing(
                      of: 30,
                    ),
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: kActiveColor,
                      child: CircleAvatar(
                          radius: 55,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey[100],
                          backgroundImage:
                              AssetImage("assets/icons/logo1.png")),
                    ),
                    HorizontalSpacing(
                      of: 40,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpacing(
                            of: 30,
                          ),
                          Text(
                            "헬로 " + user.displayName,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kBodyTextColor),
                          ),
                          VerticalSpacing(),
                          Text(user.email,
                              style: TextStyle(
                                color: kBodyTextColor,
                                fontSize: 14,
                              )),
                          VerticalSpacing(
                            of: 30,
                          ),
                          Row(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("user")
                                      .where('email', isEqualTo: user.email)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    var like = 0;
                                    if (snapshot.hasData) {
                                      like =
                                          snapshot.data.docs[0]['like'].length;
                                    }
                                    return Column(
                                      children: [
                                        Text("좋아요",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: kActiveColor)),
                                        VerticalSpacing(),
                                        InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LikeListScreen(),
                                            ),
                                          ),
                                          child: Text("$like",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: kBodyTextColor)),
                                        ),
                                      ],
                                    );
                                  }),
                              HorizontalSpacing(),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("user")
                                      .where('email', isEqualTo: user.email)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    var like = 0;
                                    if (snapshot.hasData) {
                                      like =
                                          snapshot.data.docs[0]['like'].length;
                                    }
                                    return Column(
                                      children: [
                                        Text("주문 내역",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: kActiveColor)),
                                        VerticalSpacing(),
                                        InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderListScreen(),
                                            ),
                                          ),
                                          child: Text("$like",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: kBodyTextColor)),
                                        ),
                                      ],
                                    );
                                  }),
                              HorizontalSpacing(),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("user")
                                      .where('email', isEqualTo: user.email)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    var like = 0;
                                    if (snapshot.hasData) {
                                      like =
                                          snapshot.data.docs[0]['like'].length;
                                    }
                                    return Column(
                                      children: [
                                        Text("수령대기",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: kActiveColor)),
                                        VerticalSpacing(),
                                        InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PickUpListScreen(),
                                            ),
                                          ),
                                          child: Text("$like",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: kBodyTextColor)),
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          )
                        ]),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "회원정보 관리",
                    style: TextStyle(fontSize: 17, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderListScreen(),
                    ),
                  ),
                  child: Text(
                    "알림설정",
                    style: TextStyle(fontSize: 17, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "교환 및 환불",
                    style: TextStyle(fontSize: 17, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen(),
                    ),
                  ),
                  child: Text(
                    "개인정보처리방침",
                    style: TextStyle(fontSize: 17, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "서비스이용약관",
                    style: TextStyle(fontSize: 17, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
