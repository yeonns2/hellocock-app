import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/screens/detail/components/order_bar.dart';
import 'package:hellocock/screens/detail/components/video_player.dart';

class Body extends StatelessWidget {
  final User user;
  final DocumentSnapshot document;
  Body(this.user, this.document);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            VideoPlayer(user, document),
            OrderBar(user, document),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Image.asset(
              document['detail'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ));
  }
}
