import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';

class OrderCompletedScreen extends StatelessWidget {
  final String cocktail;
  final DateTime ordertime;
  final String ordernumber;
  final String pickupstore;
  final DateTime pickuptime;

  OrderCompletedScreen(this.cocktail, this.ordertime, this.ordernumber,
      this.pickupstore, this.pickuptime);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: StreamBuilder<DocumentSnapshot>(
          stream:
              FirebaseFirestore.instance.collection("order").doc().snapshots(),
          builder: (context, snapshot) {
            return Body(snapshot.data);
          }),
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
