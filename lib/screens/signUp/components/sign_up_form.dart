import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:hellocock/screens/service_policy/service_policy_screen.dart';
import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:kopo/kopo.dart';
import 'package:flutter_svg/flutter_svg.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  KopoModel model;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이름",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 15),
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
                return '이름을 입력해주세요.';
              }
              return null;
            },
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "이메일",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 15),
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
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 15),
            cursorColor: kActiveColor,
            controller: _password,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: "6자리 이상 입력해주세요.",
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
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
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "비밀번호 확인",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: 15),
            cursorColor: kActiveColor,
            controller: _confirm,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: "6자리 이상 입력해주세요.",
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
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
              "핸드폰 번호",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: _phone,
                  style: TextStyle(fontSize: 15),
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
              // SizedBox(
              //     width: 95, child: PrimaryButton(text: "인증요청", press: () {}))
            ],
          ),
          VerticalSpacing(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(
          //       width: 180,
          //       child: TextFormField(
          //         style: TextStyle(fontSize: 13),
          //         cursorColor: kActiveColor,
          //         decoration: InputDecoration(
          //           fillColor: Colors.grey[100],
          //           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //           border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(32.0)),
          //         ),
          //         validator: (String value) {
          //           if (value.isEmpty) {
          //             return '인증 번호를 입력해주세요.';
          //           }
          //           return null;
          //         },
          //       ),
          //     ),
          //     SizedBox(
          //         width: 95, child: PrimaryButton(text: "인증완료", press: () {}))
          //   ],
          // ),
          // VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "주소",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor),
            ),
          ),
          //Text(this.model?.address ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 183,
                child: TextFormField(
                  style: TextStyle(fontSize: 15),
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
            style: TextStyle(fontSize: 15),
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: "상세주소를 입력하세요.",
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
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
          VerticalSpacing(of: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  HorizontalSpacing(of: 5),
                  Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _value1 = !_value1;
                          });
                        },
                        child: _value1
                            ? CircleAvatar(
                                backgroundColor: kActiveColor,
                                radius: 7,
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 7,
                              )),
                  ),
                  HorizontalSpacing(of: 8),
                  Text(
                    "이용약관 동의",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/arrow_next.svg"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServicePolicyScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  HorizontalSpacing(of: 5),
                  Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _value2 = !_value2;
                          });
                        },
                        child: _value2
                            ? CircleAvatar(
                                backgroundColor: kActiveColor,
                                radius: 7,
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 7,
                              )),
                  ),
                  HorizontalSpacing(of: 8),
                  Text(
                    "개인정보 취급방침 동의",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/arrow_next.svg"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  HorizontalSpacing(of: 5),
                  Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            _value3 = !_value3;
                          });
                        },
                        child: _value3
                            ? CircleAvatar(
                                backgroundColor: kActiveColor,
                                radius: 7,
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 7,
                              )),
                  ),
                  HorizontalSpacing(of: 8),
                  Text(
                    "마케팅 정보 수신 동의 (선택)",
                    style: TextStyle(
                        fontSize: 13,
                        color: kBodyTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                    icon: SvgPicture.asset("assets/icons/arrow_next.svg"),
                    onPressed: null),
              )
            ],
          ),
          VerticalSpacing(of: 30),
          Center(
            child: PrimaryButton(
                text: "가입하기",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    if (_value1 == false || _value2 == false) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              content: Text(
                                "\n약관에 동의해주세요",
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
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      _register();
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              content: Text(
                                "\n회원가입을 축하드립니다!",
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
                    }
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
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // Example code for registration.
  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        user.updateProfile(displayName: _name.text, photoURL: null);

        FirebaseFirestore.instance.collection("user").doc(_email.text).set({
          'name': _name.text,
          'email': _email.text,
          'address1': _address1.text,
          'address2': _address2.text,
          'phone': _phone.text,
          'certificated': false,
        });
      });
    } else {
      _success = false;
      dispose();
    }
  }
}
