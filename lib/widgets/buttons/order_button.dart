import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/widgets/alert.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/map/map_screen.dart';
import 'package:hellocock/size_config.dart';

class OrderButton extends StatefulWidget {
  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        height: 60,
        minWidth: SizeConfig.screenWidth - 130,
        child: Text(
          "주문하기",
          style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        color: kActiveColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        onPressed: () async {
          FirebaseAuth.instance.authStateChanges().listen((User user) {
            if (user == null) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Alert();
                  });
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(),
                  ));
            }
          });
        });
  }
}
