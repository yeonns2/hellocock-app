import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/widgets/buttons/like_button.dart';
import 'package:hellocock/widgets/buttons/order_button.dart';

class OrderBar extends StatelessWidget {
  final User user;
  final DocumentSnapshot document;

  OrderBar(this.user, this.document);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //margin: const EdgeInsets.only(bottom: 6.0),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [LikeButton(user, document), OrderButton()],
        ),
      ),
    );
  }
}
