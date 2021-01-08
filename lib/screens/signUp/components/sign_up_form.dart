import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:hellocock/widgets/buttons/mybutton.dart';

import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Entrypoint example for registering via Email/Password.
class SignUpForm extends StatefulWidget {
  /// The page title.
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success;
  String _userEmail;

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
              "이메일",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: new TextStyle(
              fontWeight: FontWeight.normal,
            ),
            cursorColor: kActiveColor,
            controller: _emailController,
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
            cursorColor: kActiveColor,
            controller: _passwordController,
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
            cursorColor: kActiveColor,
            controller: _passwordController,
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
                width: 190,
                child: TextFormField(
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  obscureText: true,
                ),
              ),
              HorizontalSpacing(
                of: 10,
              ),
              SizedBox(
                  width: 90, child: PrimaryButton(text: "인증요청", press: () {}))
            ],
          ),
          VerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 190,
                child: TextFormField(
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                  width: 90, child: PrimaryButton(text: "인증완료", press: () {}))
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 190,
                child: TextFormField(
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  obscureText: true,
                ),
              ),
              HorizontalSpacing(
                of: 10,
              ),
              SizedBox(
                  width: 90, child: PrimaryButton(text: "우편번호", press: () {}))
            ],
          ),
          VerticalSpacing(),
          TextFormField(
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            obscureText: true,
          ),
          VerticalSpacing(),
          Center(
            child: PrimaryButton(
                text: "가입하기",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _register();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.asset(
                                    "assets/icons/mycock.svg",
                                  ),
                                ),
                                VerticalSpacing(
                                  of: 20,
                                ),
                                Text(
                                  "회원가입이 완료되었습니다.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kBodyTextColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                                child: new Text(
                                  "로그인하기",
                                  style: TextStyle(color: kActiveColor),
                                ),
                              ),
                              SizedBox(
                                width: 80,
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
      dispose();
    }
  }
}
