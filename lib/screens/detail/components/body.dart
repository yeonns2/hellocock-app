import 'package:cached_network_image/cached_network_image.dart';
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
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: VideoPlayer(document),
            ),
            OrderBar(user, document),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: CachedNetworkImage(
              imageUrl: document['detail'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
