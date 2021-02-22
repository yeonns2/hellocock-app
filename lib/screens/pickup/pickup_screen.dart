import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';
import 'components/body.dart';

class PickUpScreen extends StatelessWidget {
  final DocumentSnapshot cart;
  final DocumentSnapshot store;
  PickUpScreen(this.cart, this.store);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: Body(cart, store),
    );
  }
}
