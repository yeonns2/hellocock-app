import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';

import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/widgets/primary_alert.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class VerifyAuthState extends StatefulWidget {
  final User user;
  final String recieptId;
  VerifyAuthState(this.user, this.recieptId);
  @override
  _VerifyAuthStateState createState() => _VerifyAuthStateState();
}

class _VerifyAuthStateState extends State<VerifyAuthState> {
  @override
  void initState() {
    // TODO: implement initState
    var _url = 'https://hellocock-certification.herokuapp.com/api/user/verify' +
        widget.user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 10),
              child: Stack(
                children: [
                  Center(
                      child: Container(
                    child: Text(
                      "카카오톡에서 성인인증 후 완료버튼을 눌러주세요",
                      style: kHeadlineTextStyle,
                    ),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PrimaryButton(
                        text: "완료",
                        press: () async {
                          var data = {"receiptId": widget.recieptId};
                          var body = json.encode(data);
                          http.Response _res = await http.post(
                              Uri.parse(
                                  "https://hellocock-certification.herokuapp.com/api/user/verify" +
                                      widget.user.email),
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
                                    content: "성인인증이 완료되지 않으면 \n키트 구매가 불가능해요.🥺",
                                    action: "확인",
                                  );
                                });
                          }
                        }),
                  )
                ],
              )),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
    );
  }
}
