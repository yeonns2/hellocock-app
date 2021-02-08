import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:hellocock/screens/signUp/sign_up_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';

import '../../constants.dart';
import '../../size_config.dart';

class FindIDScreen extends StatefulWidget {
  @override
  _FindIDScreenState createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacing(of: 60),
                Text(
                  "이메일 찾기",
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: kActiveColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpacing(of: 50),
                !finded
                    ? _build1(context)
                    : FutureBuilder(
                        future: _fetch1(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator();
                          }
                          //error가 발생하게 될 경우 반환하게 되는 부분
                          else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }
                          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                          else {
                            return isemail
                                ? _build2(context, snapshot.data.toString())
                                : _build2(context, snapshot.data.toString());
                          }
                        })
              ],
            )));
  }

  Future<String> _fetch1() async {
    String email = "";
    await Future.delayed(Duration(seconds: 2));
    FirebaseFirestore.instance
        .collection('user')
        .where('name', isEqualTo: _nameController.text)
        .where('phone', isEqualTo: _phoneController.text)
        .get()
        .then((value) {
      email = value.docs[0]["email"];
      print(email);
    });
    return email;
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
                      finded = true;
                      isemail = true;
                    });
                  }
                }))
      ]),
    );
  }

  Widget _build2(BuildContext context, String myemail) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _nameController.text + "님의 가입된 이메일",
        style: TextStyle(
            color: kBodyTextColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            height: 2.5),
      ),
      Text(
        email,
        style: TextStyle(
            color: kActiveColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      VerticalSpacing(of: 500),
      Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
              text: "로그인 하기",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              }))
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
      VerticalSpacing(of: 500),
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
