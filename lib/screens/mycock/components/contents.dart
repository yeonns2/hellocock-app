import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyCocktail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                  width: 80,
                  child: Image.asset("assets/images/bluehawaii.png")),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  "2020.10.03",
                  style: TextStyle(color: kActiveColor, fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
