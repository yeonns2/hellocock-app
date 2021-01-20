import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(
              of: 40,
            ),
            Row(
              children: [
                SizedBox(
                    width: 100,
                    child: Image.asset("assets/images/bluehawaii.png")),
              ],
            ),
            Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 5, bottom: 10, right: 20),
              child: Text(
                "2020.10.03",
                style: TextStyle(color: kActiveColor, fontSize: 10),
              ),
            ),
            VerticalSpacing(),
            Row(
              children: [
                SizedBox(
                    width: 100,
                    child: Image.asset("assets/images/bluehawaii.png")),
              ],
            ),
            Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 5, bottom: 10, right: 20),
              child: Text(
                "2020.10.03",
                style: TextStyle(color: kActiveColor, fontSize: 10),
              ),
            ),
            Row(
              children: [
                SizedBox(
                    width: 100,
                    child: Image.asset("assets/images/bluehawaii.png")),
              ],
            ),
            Divider(
              thickness: 1.5,
              color: kActiveColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 5, bottom: 10, right: 20),
              child: Text(
                "2020.10.03",
                style: TextStyle(color: kActiveColor, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
