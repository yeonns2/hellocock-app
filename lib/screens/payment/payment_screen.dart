import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  final User user;
  final DocumentSnapshot cocktaildocument;
  final DocumentSnapshot storedocument;
  final int _totalprice;
  final String _selectedtime;
  PaymentScreen(this.user, this.cocktaildocument, this.storedocument,
      this._totalprice, this._selectedtime);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //appBar: buildAppBar(context),
      body: Body(
          user, cocktaildocument, storedocument, _totalprice, _selectedtime),
    );
  }
}
