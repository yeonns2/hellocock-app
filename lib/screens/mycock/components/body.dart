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
                Column(
                  children: [
                    SizedBox(
                        width: 80,
                        child: Image.asset("assets/images/bluehawaii.png")),
                    SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 1.5,
                        color: kActiveColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.5, top: 5, bottom: 10, right: 12.5),
                      child: Text(
                        "2020.10.03",
                        style: TextStyle(color: kActiveColor, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 80,
                        child: Image.asset("assets/images/bluehawaii.png")),
                    SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 1.5,
                        color: kActiveColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.5, top: 5, bottom: 10, right: 12.5),
                      child: Text(
                        "2020.10.03",
                        style: TextStyle(color: kActiveColor, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 80,
                        child: Image.asset("assets/images/bluehawaii.png")),
                    SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 1.5,
                        color: kActiveColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.5, top: 5, bottom: 10, right: 12.5),
                      child: Text(
                        "2020.10.03",
                        style: TextStyle(color: kActiveColor, fontSize: 10),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
