import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/widgets/primary_alert.dart';
import 'package:http/http.dart' as http;

class VerifyAuthState extends StatefulWidget {
  final User user;
  final String recieptId;
  VerifyAuthState(this.user, this.recieptId);
  @override
  _VerifyAuthStateState createState() => _VerifyAuthStateState();
}

class _VerifyAuthStateState extends State<VerifyAuthState> {
  var _url = 'https://hellocock-certification.herokuapp.com/api/user/verify';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "카카오톡에서 본인인증 후 완료버튼을 눌러주세요",
                    style: kHeadlineTextStyle,
                  ),
                ),
                VerticalSpacing(of: 30),
                PrimaryButton(
                    text: "완료",
                    press: () async {
                      var data = {"receiptId": widget.recieptId};
                      var body = json.encode(data);
                      http.Response _res = await http.post(
                          "$_url/" + widget.user.email,
                          headers: {"Content-Type": "application/json"},
                          body: body);

                      String responsebody = _res.body;

                      Map<String, dynamic> list = jsonDecode(responsebody);
                      print(list['result']['state']);
                      if (list['result']['state'] == 1) {
                        FirebaseFirestore.instance
                            .collection("user")
                            .doc(widget.user.email)
                            .update({'certificated': true}).then(
                                (value) => Navigator.pop(context));
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Alert(
                                title: "성인인증 미완료",
                                content: "성인인증이 완료되지 않았습니다.",
                                action: "확인",
                              );
                            });
                      }
                    }),
              ],
            ))));
  }
}
