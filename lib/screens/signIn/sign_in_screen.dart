import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/signIn/components/tap.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/bottom_nav_bar.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder<FirebaseUser>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return TabPage(snapshot.data);
      } else {
        return Scaffold(
          body: Body(),
        );
      }
    });
  }
}
