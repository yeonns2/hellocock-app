import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyCocktail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Text(
                "2020.10.03",
                style: TextStyle(color: kActiveColor, fontSize: 10),
              ),
            ),
            SizedBox(
                width: 80, child: Image.asset("assets/images/bluehawaii.png")),
          ],
        ),
      ],
    );
  }
}
