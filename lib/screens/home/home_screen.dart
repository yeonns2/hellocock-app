import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
//import 'package:hellocock/screens/signIn/sign_in_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: SizedBox(
        width: 226,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 246,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/drawerheader.png"),
                    ),
                  ),
                ),
              ),
              VerticalSpacing(of: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "- 공지사항",
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "- 1:1 문의 ",
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "- 이용방법",
                        style: TextStyle(fontSize: 14, color: kBodyTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // leading: FlatButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.menu,
      //     color: kActiveColor,
      //   ),
      // ),
      title: Text("hellocock",
          style: TextStyle(color: kActiveColor, fontFamily: 'NotoSans')),
    );
  }
}
