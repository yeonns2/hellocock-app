import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:kopo/kopo.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ModifyForm extends StatefulWidget {
  @override
  _ModifyFormState createState() => _ModifyFormState();
}

class _ModifyFormState extends State<ModifyForm> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();

  bool _success;
  String _userEmail;

  KopoModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이름",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 13),
            keyboardType: TextInputType.name,
            autofocus: false,
            cursorColor: kActiveColor,
            controller: _name,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '이메일을 입력해주세요.';
              }
              return null;
            },
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이메일",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 13),
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            cursorColor: kActiveColor,
            controller: _email,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '이메일을 입력해주세요.';
              }
              return null;
            },
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "비밀번호",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 13),
            cursorColor: kActiveColor,
            controller: _password,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: "6자리 이상 입력해주세요.",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '비밀번호를 입력해주세요';
              }
              return null;
            },
            obscureText: true,
          ),
          VerticalSpacing(
            of: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "비밀번호 확인",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 13),
            cursorColor: kActiveColor,
            controller: _confirm,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: "6자리 이상 입력해주세요.",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '비밀번호를 입력해주세요';
              }
              if (value != _password.text) {
                return '비밀번호가 맞지 않습니다.';
              }
              return null;
            },
            obscureText: true,
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "핸드폰 / 성인인증",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                child: TextFormField(
                  controller: _phone,
                  style: TextStyle(fontSize: 13),
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '핸드폰 번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                  width: 95, child: PrimaryButton(text: "인증요청", press: () {}))
            ],
          ),
          VerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                child: TextFormField(
                  style: TextStyle(fontSize: 13),
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '인증 번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                  width: 95, child: PrimaryButton(text: "인증완료", press: () {}))
            ],
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "주소",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          //Text(this.model?.address ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 183,
                child: TextFormField(
                  style: TextStyle(fontSize: 13),
                  controller:
                      TextEditingController(text: this.model?.address ?? ""),
                  onTap: () async {
                    this.model = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Kopo()),
                    );
                    _address1.text = this.model?.address;

                    setState(() {});
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '주소를 입력해주세요';
                    }
                    return null;
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 94,
                child: PrimaryButton(
                  text: "우편번호",
                  press: () async {
                    this.model = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Kopo()),
                    );
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          VerticalSpacing(),
          TextFormField(
            controller: _address2,
            style: TextStyle(fontSize: 13),
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return '주소를 입력해주세요';
              }
              return null;
            },
          ),
          VerticalSpacing(),
          Center(
            child: PrimaryButton(
                text: "가입하기",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(''),
                            content: Text(
                              "회원가입을 축하드립니다!\n",
                              style: TextStyle(
                                fontSize: 13,
                                color: kBodyTextColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              new CupertinoDialogAction(
                                child: Text(
                                  '확인',
                                  style: TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    //dispose();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
