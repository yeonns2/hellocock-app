import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/detail/components/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellocock/screens/map/map_screen.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              VideoPlayer(),
              Container(
                height: 55,
                margin: const EdgeInsets.only(bottom: 6.0),
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton(
                        height: 60,
                        minWidth: 130,
                        child: SvgPicture.asset(
                          "assets/icons/order.svg",
                          height: 20,
                          width: 20,
                        ),
                        onPressed: () {},
                      ),
                      FlatButton(
                        height: 60,
                        minWidth: SizeConfig.screenWidth - 130,
                        child: Text(
                          "주문하기",
                          style: TextStyle(
                              fontFamily: "NotoSans",
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        color: kActiveColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "블루하와이",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "하와이 해변을 떠올리게하는 색감과\n청량한 맛에 매력적인 칵테일 이제부터\n푸른 바다향을 느껴봐요!",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 15),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "레시피",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "1.종이컵 두 배 정도 높이가 되고, 너무 \n넓지 않은 투명한 잔을 준비해요. ",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 15),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "구성품",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Image.asset("assets/images/bacardi.jpg"),
                          Image.asset("assets/images/bacardi.jpg"),
                        ],
                      ),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "키트 이미지",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Image.asset("assets/images/bacardi.jpg"),
                          Image.asset("assets/images/bacardi.jpg"),
                        ],
                      ),
                    ),
                    VerticalSpacing(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
