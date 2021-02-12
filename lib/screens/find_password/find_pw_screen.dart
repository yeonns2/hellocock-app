import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/signUp/sign_up_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';

import '../../constants.dart';
import '../../size_config.dart';

class FindPWScreen extends StatefulWidget {
  @override
  _FindPWScreenState createState() => _FindPWScreenState();
}

class _FindPWScreenState extends State<FindPWScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  bool finded = false;
  bool isemail = false;
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        VerticalSpacing(of: 60),
        Text(
          "비밀번호 찾기",
          textScaleFactor: 1,
          style: TextStyle(
              color: kActiveColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        VerticalSpacing(
          of: 50,
        ),
        !finded
            ? _build1(context)
            : isemail
                ? _build2(context, email)
                : _build3(context),
      ]),
    ));
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Widget _build1(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          controller: _nameController,
          style: TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: "이름을 입력해주세요.",
            hintStyle: TextStyle(color: kBodyTextColor, fontSize: 13),
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return '이름을 입력해주세요.';
            }
            return null;
          },
        ),
        VerticalSpacing(),
        TextFormField(
          controller: _phoneController,
          style: TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: "전화번호을 입력해주세요.",
            hintStyle: TextStyle(color: kBodyTextColor, fontSize: 13),
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return '전화번호을 입력해주세요.';
            }
            return null;
          },
        ),
        VerticalSpacing(of: 500),
        Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(
                text: "확인",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection("user")
                          .where('name', isEqualTo: _nameController.text)
                          .where('phone', isEqualTo: _phoneController.text)
                          .get()
                          .then((value) {
                        email = value.docs[0]['email'];
                      });
                    });
                    await Future.delayed(Duration(seconds: 1));

                    setState(() {
                      finded = true;
                      if (email != "") isemail = true;
                    });
                  }
                }))
      ]),
    );
  }

  Widget _build2(BuildContext context, String myemail) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _nameController.text + "님의 가입된 이메일로  \n비밀번호 재설정을 위한 링크를 보내드립니다. ",
        style: TextStyle(
            color: kBodyTextColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            height: 1.5),
      ),
      Text(
        myemail,
        style: TextStyle(
            color: kActiveColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            height: 2.0),
      ),
      VerticalSpacing(of: 500),
      Align(
        alignment: Alignment.bottomCenter,
        child: PrimaryButton(
            text: "인증메일 보내기",
            press: () {
              resetPassword(email);
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "전송 완료",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      content: Text(
                        "비밀번호 재설정을 위한 \n이메일을 발송하였습니다.",
                        style: TextStyle(fontSize: 13, height: 1.3),
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        new CupertinoDialogAction(
                            child: Text(
                              '확인',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              int count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 2;
                              });
                            }),
                      ],
                    );
                  });
            }),
      ),
    ]);
  }

  Widget _build3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _nameController.text + "님은 등록된 회원이 아닙니다.",
        style: TextStyle(
            color: kBodyTextColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            height: 2.5),
      ),
      VerticalSpacing(of: 550),
      Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
              text: "회원가입 하기",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              }))
    ]);
  }
}
