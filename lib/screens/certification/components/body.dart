import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;
  Body(this.user, this.document);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final String _url = "https://hellocock-server.herokuapp.com/";

    Future fetch() async {
      var data = {
        "RecieverBirthDay": "970520",
        "RecieverHP": "01076761687",
        //"RecieverName": "안정연"
      };

      var res = await http.get(
        "$_url/data",
        headers: data,
      );

      return json.decode(json.encode(res.headers));
    }

    return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacing(of: 20),
                Text(
                  "헬로콕의 칵테일 키트에는\n칵테일을 만들기 위한 보드카 등\n미니어쳐 주류가 들어있기 때문에\n키트 구입을 위해서는 \n성인인증이 필수입니다.",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.document['certificated']
                          ? kBodyTextColor
                          : kActiveColor),
                ),
                VerticalSpacing(
                  of: 30,
                ),
                Text(
                  widget.document['certificated']
                      ? widget.user.displayName + "님은 성인인증을 완료하였습니다."
                      : widget.user.displayName + "님은 성인인증이 필요합니다.",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.document['certificated']
                          ? kActiveColor
                          : kBodyTextColor),
                ),
              ],
            ),
            if (widget.document['certificated'])
              VerticalSpacing()
            else
              Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                    text: "성인인증 하러가기",
                    press: () async {
                      Map data = {
                        "RecieverBirthDay": "970520",
                        "RecieverHP": "01076761687",
                        //"RecieverName": "안정연"
                      };

                      String body = json.encode(data);
                      http.Response response = await http.post(
                        _url,
                        headers: {"Content-Type": "application/json"},
                        body: body,
                      );
                      print(response.body);
                      // FirebaseFirestore.instance
                      //     .collection("user")
                      //     .doc(widget.user.email)
                      //     .update({'certificated': true});
                    }),
              ),
          ],
        ));
  }
}
