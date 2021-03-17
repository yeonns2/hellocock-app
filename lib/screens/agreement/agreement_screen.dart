import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/extrainfo/extrainfo_screen.dart';
import 'package:hellocock/screens/policy/privacy_policy/privacy_policy_screen.dart';
import 'package:hellocock/screens/policy/service_policy/service_policy_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../size_config.dart';

class AgreementScreen extends StatefulWidget {
  final User user;
  AgreementScreen(this.user);
  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool value_all = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(of: 60),
              Text(
                "약관동의",
                textScaleFactor: 1,
                style: TextStyle(
                    color: kActiveColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(of: 50),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Checkbox(
                      value: value_all,
                      onChanged: (bool value) {
                        setState(() {
                          value_all = !value_all;
                          if (value_all = true) {
                            value1 = true;
                            value2 = true;
                            value3 = true;
                          }
                        });
                      },
                      hoverColor: kActiveColor,
                      focusColor: kActiveColor,
                      activeColor: kActiveColor,
                    ),
                  ),
                  Text(
                    " 모든 약관 동의",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kBodyTextColor),
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: kBodyTextColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value1,
                          onChanged: (bool value) {
                            setState(() {
                              value1 = !value1;
                              if (value1 == false) value_all = false;
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " [필수] 개인정보 취급방침 동의",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 13, color: kBodyTextColor),
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
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value2,
                          onChanged: (bool value) {
                            setState(() {
                              value2 = !value2;
                              if (value2 == false) value_all = false;
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " [필수] 이용약관동의",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 13, color: kBodyTextColor),
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
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Checkbox(
                          value: value3,
                          onChanged: (bool value) {
                            setState(() {
                              value3 = !value3;
                              if (value3 == false) value_all = false;
                            });
                          },
                          hoverColor: kActiveColor,
                          focusColor: kActiveColor,
                          activeColor: kActiveColor,
                        ),
                      ),
                      Text(
                        " [선택] 마케팅 정보 수신 동의",
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 13, color: kBodyTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(
              press: () {
                if (value1 == false || value2 == false) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          content: Text(
                            "약관에 동의해야 \n서비스를 이용할 수 있습니다.",
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
                  FirebaseFirestore.instance
                      .collection("user")
                      .doc(widget.user.uid)
                      .set({'marketing_agreement': false});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExtraInfoScreen(widget.user),
                      ));
                }
              },
              text: "확인",
            ),
          )
        ]),
      ),
    );
  }
}
