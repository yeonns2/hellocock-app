import 'package:bootpay_api/model/user.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class VirginCocktailScreen extends StatelessWidget {
  final User user;
  const VirginCocktailScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
