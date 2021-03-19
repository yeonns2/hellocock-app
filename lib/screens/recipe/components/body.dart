import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:hellocock/screens/detail/components/video_player.dart';

class Body extends StatelessWidget {
  final DocumentSnapshot document;
  Body(this.document);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            VideoPlayer(document),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Image.asset(
              document['recipe'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
