import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';

import '../../../size_config.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key key,
    @required this.illustration,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(illustration),
          ),
        ),
        VerticalSpacing(of: 30),
        Text(
          title,
          style: kHeadlineTextStyle,
        ),
        VerticalSpacing(of: 20),
        Text(
          text,
          style: kBodyTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
