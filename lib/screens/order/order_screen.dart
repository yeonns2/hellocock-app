import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';

class OrderScreen extends StatelessWidget {
  final User user;
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  OrderScreen(this.user, this.cocktaildocument, this.storedocument);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: Body(user, cocktaildocument, storedocument),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.menu,
            color: kActiveColor,
          ),
        ),
      ],
    );
  }
}
