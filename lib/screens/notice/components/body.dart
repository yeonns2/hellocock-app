import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 35,
              color: kActiveColor,
              child: Center(
                  child: Text(
                "공지사항",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  //Divider(thickness: 1),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: SvgPicture.asset("assets/icons/arrow_down.svg"),
                    title: Text(
                      "     무통장 입금 쉽게하는 방법",
                      style: TextStyle(fontSize: 13.0, color: kBodyTextColor),
                    ),
                    children: <Widget>[],
                  ),
                  //Divider(thickness: 1),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: SvgPicture.asset("assets/icons/arrow_down.svg"),
                    title: Text(
                      "     무통장 입금 쉽게하는 방법",
                      style: TextStyle(fontSize: 13.0, color: kBodyTextColor),
                    ),
                    children: <Widget>[
                      Container(
                        color: Colors.grey[100],
                        height: 100,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("쉽게하는 법따위 없다"),
                        ),
                      )
                    ],
                  ),
                  //Divider(thickness: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
