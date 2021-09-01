import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:kopo/kopo.dart';

class Delivery extends StatefulWidget {
  final User user;
  final DocumentSnapshot cart;

  Delivery(this.user, this.cart);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  KopoModel model;
  TextEditingController _address1 = TextEditingController();
  TextEditingController _address2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 50,
      ),
      Text(
        "배송지 등록",
        textScaleFactor: 1,
        style: TextStyle(
            color: kActiveColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      VerticalSpacing(of: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth - 200,
            child: TextFormField(
              style: TextStyle(fontSize: 15),
              controller:
                  TextEditingController(text: this.model?.address ?? ""),
              onTap: () async {
                this.model = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Kopo()),
                );
                _address1.text = this.model?.address;

                setState(() {
                  _address1.text = this.model?.address;
                });
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
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          VerticalSpacing(),
          SizedBox(
            width: 100,
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
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '주소를 입력해주세요';
          }
          return null;
        },
      ),
      VerticalSpacing(),
      PrimaryButton(text: "배송지 등록", press: () {}),
      VerticalSpacing(of: 20),
    ]);
  }
}
