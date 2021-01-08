import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;
  @override
  Widget build(BuildContext context) {
    final isliked = _liked;
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
          if (isliked) {
            _liked = false;
          } else {
            _liked = true;
          }
        });
      },
    );
  }
}
