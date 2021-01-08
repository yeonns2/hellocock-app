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
            children: <Widget>[
              Container(
                height: 246,
                child: SvgPicture.asset("assets/images/drawer.svg"),
              ),
              VerticalSpacing(of: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text("data"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("data"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("data"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("data"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("hellocock",
          style: TextStyle(color: kActiveColor, fontFamily: 'NotoSans')),
      // actions: [
      //   FlatButton(
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.menu,
      //       color: kActiveColor,
      //     ),
      //   ),
      // ],
    );
  }
}
