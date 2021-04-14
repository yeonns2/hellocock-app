import 'package:cached_network_image/cached_network_image.dart';
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
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          Expanded(
            child: illustration == 'assets/icons/logo1.svg'
                ? AspectRatio(
                    aspectRatio: 0.3,
                    child: SvgPicture.asset(illustration),
                  )
                : AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(imageUrl: illustration),
                  ),
          ),
          Text(
            title,
            textScaleFactor: 1,
            style: kHeadlineTextStyle,
          ),
          VerticalSpacing(of: 20),
          Text(
            text,
            textScaleFactor: 1,
            style: kBodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
