import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacing(
            of: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
          ),
          VerticalSpacing(
            of: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
          ),
          VerticalSpacing(
            of: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
