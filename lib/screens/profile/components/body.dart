import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/certification/certification_screen.dart';
import 'package:hellocock/screens/likelist/likelist_screen.dart';
import 'package:hellocock/screens/memberinfo/memberinfo_screen.dart';
import 'package:hellocock/screens/notification_setting/notification_setting_screen.dart';
import 'package:hellocock/screens/orderlist/orderlist_screen.dart';
import 'package:hellocock/screens/pickuplist/pickuplist_screen.dart';
import 'package:hellocock/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:hellocock/screens/service_policy/service_policy_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  final User user;
  Body(this.user);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                        color: Colors.grey[300],
                        offset: Offset(0.0, 2.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 56,
                          backgroundColor: kActiveColor,
                          child: CircleAvatar(
                              radius: 55.5,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              child:
                                  SvgPicture.asset("assets/images/hello.svg"))),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerticalSpacing(
                              of: 30,
                            ),
                            Text(
                              "헬로 " + widget.user.displayName,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kBodyTextColor),
                            ),
                            VerticalSpacing(),
                            Text(widget.user.email,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: kBodyTextColor,
                                  fontSize: 15,
                                )),
                            VerticalSpacing(
                              of: 30,
                            ),
                            Row(
                              children: [
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection("cocktail")
                                        .where('likedUsers',
                                            arrayContains: widget.user.email)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      var like = 0;
                                      if (snapshot.hasData) {
                                        like = snapshot.data.docs.length;
                                      }
                                      return Column(
                                        children: [
                                          Text("좋아요",
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: kActiveColor)),
                                          VerticalSpacing(),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LikeListScreen(widget.user),
                                              ),
                                            ),
                                            child: Text('$like',
                                                textScaleFactor: 1,
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
                                        .collection("order")
                                        .where('email',
                                            isEqualTo: widget.user.email)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      var like = 0;
                                      if (snapshot.hasData) {
                                        like = snapshot.data.docs.length;
                                      }
                                      return Column(
                                        children: [
                                          Text("주문 내역",
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: kActiveColor)),
                                          VerticalSpacing(),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderListScreen(
                                                        widget.user),
                                              ),
                                            ),
                                            child: Text("$like",
                                                textScaleFactor: 1,
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
                                        .collection('order')
                                        .where('email',
                                            isEqualTo: widget.user.email)
                                        .where('pickedup', isEqualTo: true)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      var order = 0;
                                      if (snapshot.hasData) {
                                        order = snapshot.data.docs.length;
                                      }
                                      return Column(
                                        children: [
                                          Text("수령대기",
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: kActiveColor)),
                                          VerticalSpacing(),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PickUpListScreen(
                                                        widget.user),
                                              ),
                                            ),
                                            child: Text("$order",
                                                textScaleFactor: 1,
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberInfoScreen(widget.user),
                    ),
                  ),
                  child: Text(
                    "회원정보 관리",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CertificationScreen(widget.user),
                    ),
                  ),
                  child: Text(
                    "성인인증",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NotificationSettingScreen(widget.user),
                    ),
                  ),
                  child: Text(
                    "알림설정",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalSpacing(of: 20),
                // InkWell(
                //   onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ClaimScreen(),
                //     ),
                //   ),
                //   child: Text(
                //     "교환 및 환불",
                //     style: TextStyle(fontSize: 17, color: kBodyTextColor),
                //   ),
                // ),
                // VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen(),
                    ),
                  ),
                  child: Text(
                    "개인정보처리방침",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicePolicyScreen(),
                    ),
                  ),
                  child: Text(
                    "서비스이용약관",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.w500),
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
