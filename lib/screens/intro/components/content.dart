import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';

import '../../../size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            aspectRatio: illustration == 'assets/icons/logo1.svg' ? 0.3 : 1,
            child: SvgPicture.asset(illustration),
          ),
        ),
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
