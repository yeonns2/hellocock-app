import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:hellocock/constants.dart';
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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacing(
            of: 20,
          ),
          Text(
            " 푸시 알림",
            textScaleFactor: 1.0,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          Container(
              margin: EdgeInsets.zero,
              width: 325,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFF4FBFE),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                child: Text(
                  "헬로콕 앱에서 보내는 알림을 받을 수 있습니다. 알림에 관한 설정은 '설정 앱 > 알림 > 헬로콕'에서 변경할 수 \n있습니다.",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: kBodyTextColor, fontSize: 12, height: 1.5),
                ),
              )),
          VerticalSpacing(of: 30),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 광고성 정보 수신 동의",
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: kBodyTextColor),
              ),
              Container(
                width: 48.0,
                height: 24.0,
                child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("user")
                        .doc(widget.user.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      bool _value = snapshot.data['marketing_agreement'];
                      return AdvancedSwitch(
                        width: 48.0,
                        height: 24.0,
                        value: _value,
                        onChanged: (bool newValue) {
                          setState(() {
                            _value = newValue;
                            FirebaseFirestore.instance
                                .collection("user")
                                .doc(widget.user.email)
                                .update({'marketing_agreement': _value});
                          });
                        },
                        activeColor: kActiveColor,
                      );
                    }),
              ),
            ],
          ),
          VerticalSpacing(),
          Container(
              margin: EdgeInsets.zero,
              width: 325,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF4FBFE),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 11),
                child: Text(
                  "신규 서비스 및 고객 맞춤 혜택 정보를 받을 수 있습니다.",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 12, height: 1.5, color: kBodyTextColor),
                ),
              )),
        ],
      ),
    ));
  }
}
