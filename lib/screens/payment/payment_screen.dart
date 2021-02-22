import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  final DocumentSnapshot cart;

  PaymentScreen(this.cart);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: Body(cart),
    );
  }
}
