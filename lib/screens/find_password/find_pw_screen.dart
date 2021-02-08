import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
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
  TextEditingController _emailController = new TextEditingController();
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Padding(
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
          Text(
            "비밀번호를 재설정할 \n이메일을 입력해주세요",
            style: TextStyle(
                color: kBodyTextColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                height: 1.5),
          ),
          VerticalSpacing(of: 20),
          TextFormField(
            controller: _emailController,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: "이메일을 입력해주세요.",
              hintStyle: TextStyle(color: kBodyTextColor, fontSize: 13),
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
          VerticalSpacing(of: 480),
          Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                  text: "확인",
                  press: () {
                    if (_formKey.currentState.validate())
                      resetPassword(_emailController.text);
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
                                color: kBodyTextColor,
                              ),
                            ),
                            content: Text(
                              "비밀번호 재설정을 위한 \n이메일을 발송하였습니다.",
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
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInScreen(),
                                      ))),
                            ],
                          );
                        });
                  }))
        ]),
      ),
    ));
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
