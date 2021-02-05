import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/screens/bottom_nav_bar.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:kopo/kopo.dart';

class ModifyForm extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;
  ModifyForm(this.user, this.document);

  @override
  _ModifyFormState createState() => _ModifyFormState();
}

class _ModifyFormState extends State<ModifyForm> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();

  KopoModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VerticalSpacing(of: 10),
          Text(
            "이름",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          TextFormField(
            controller:
                new TextEditingController(text: widget.document['name']),
            style: TextStyle(fontSize: 13, color: kBodyTextColor),
            keyboardType: TextInputType.name,
            readOnly: true,
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          VerticalSpacing(
            of: 20,
          ),
          Text(
            "이메일",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          TextFormField(
            style: TextStyle(fontSize: 13, color: kBodyTextColor),
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            readOnly: true,
            cursorColor: kActiveColor,
            controller:
                new TextEditingController(text: widget.document['email']),
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
          VerticalSpacing(
            of: 30,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "비밀번호",
          //     style:
          //         TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
          //   ),
          // ),
          // TextFormField(
          //   style: TextStyle(fontSize: 13),
          //   cursorColor: kActiveColor,
          //   controller: _password,
          //   decoration: InputDecoration(
          //     fillColor: Colors.grey[100],
          //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //     hintText: "6자리 이상 입력해주세요.",
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(32.0),
          //     ),
          //   ),
          //   validator: (String value) {
          //     if (value.isEmpty) {
          //       return '비밀번호를 입력해주세요';
          //     }
          //     return null;
          //   },
          //   obscureText: true,
          // ),
          // VerticalSpacing(
          //   of: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "비밀번호 확인",
          //     style:
          //         TextStyle(fontWeight: FontWeight.bold, color: kBodyTextColor),
          //   ),
          // ),
          // TextFormField(
          //   style: TextStyle(fontSize: 13),
          //   cursorColor: kActiveColor,
          //   controller: _confirm,
          //   decoration: InputDecoration(
          //     fillColor: Colors.grey[100],
          //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //     hintText: "6자리 이상 입력해주세요.",
          //     border:
          //         OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          //   ),
          //   validator: (String value) {
          //     if (value.isEmpty) {
          //       return '비밀번호를 입력해주세요';
          //     }
          //     if (value != _password.text) {
          //       return '비밀번호가 맞지 않습니다.';
          //     }
          //     return null;
          //   },
          //   obscureText: true,
          // ),
          // VerticalSpacing(),
          Text(
            "핸드폰 번호",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: _phone,
                  style: TextStyle(fontSize: 13, color: kBodyTextColor),
                  cursorColor: kActiveColor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              // SizedBox(
              //     width: 95, child: PrimaryButton(text: "인증요청", press: () {}))
            ],
          ),
          // VerticalSpacing(),
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
          VerticalSpacing(of: 30),
          Text(
            "주소",
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 183,
                child: TextFormField(
                  style: TextStyle(fontSize: 13, color: kBodyTextColor),
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
            style: TextStyle(fontSize: 13, color: kBodyTextColor),
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
          VerticalSpacing(
            of: 140,
          ),
          Center(
            child: PrimaryButton(
                text: "변경 완료",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    FirebaseFirestore.instance
                        .collection("user")
                        .doc(widget.user.email)
                        .update({
                      'address1': _address1.text,
                      'address2': _address2.text,
                      'phone': _phone.text,
                    });
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(''),
                            content: Text(
                              "변경되었습니다. \n",
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
                                          builder: (context) =>
                                              BottomNavBar(widget.user),
                                        ));
                                  }),
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
