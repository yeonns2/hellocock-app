import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/orderlist/components/contents.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          VerticalSpacing(of: 50),
          OrderCard(),
          VerticalSpacing(of: 30),
          OrderCard(),
          VerticalSpacing(of: 30),
          OrderCard(),
          VerticalSpacing(of: 30),
          OrderCard(),
          VerticalSpacing(of: 50),
        ],
      ),
    );
  }
}
