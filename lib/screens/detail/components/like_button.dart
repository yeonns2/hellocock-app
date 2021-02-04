import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;

  LikeButton(this.user, this.document);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isliked;
  @override
  void initState() {
    super.initState();
    List likedUsers = List<String>.from(widget.document['likedUsers']);

    if (likedUsers.contains(widget.user.email))
      isliked = true;
    else
      isliked = false;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 60,
      minWidth: 130,
      child: SvgPicture.asset(
        isliked ? "assets/icons/like_full.svg" : "assets/icons/like.svg",
        height: 20,
        width: 20,
      ),
      onPressed: () {
        setState(() {
          if (!isliked) {
            _like();
          } else {
            _unlike();
          }
        });
      },
    );
  }

  void _like() {
    final List likedUsers =
        List<String>.from(widget.document['likedUsers'] ?? []);

    likedUsers.add(widget.user.email);

    final updateData = {
      'likedUsers': likedUsers,
    };
    FirebaseFirestore.instance
        .collection('cocktail')
        .doc(widget.document.id)
        .update(updateData);
    isliked = true;
  }

  void _unlike() {
    final List likedUsers =
        List<String>.from(widget.document['likedUsers'] ?? []);

    likedUsers.remove(widget.user.email);

    final updateData = {
      'likedUsers': likedUsers,
    };
    FirebaseFirestore.instance
        .collection('cocktail')
        .doc(widget.document.id)
        .update(updateData);
    isliked = false;
  }
}
