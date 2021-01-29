import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';

import 'components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatelessWidget {
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  MenuScreen(this.cocktaildocument, this.storedocument);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(cocktaildocument, storedocument),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          color: kActiveColor,
          onPressed: () => Navigator.pop(context)),
      title: SvgPicture.asset("assets/icons/hellocock_title.svg"),
    );
  }
}
