import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/model/model_cocktail.dart';
import 'package:hellocock/widgets/cards/card.dart';
import 'package:hellocock/screens/detail/detail_screen.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    //streamData = firebaseFirestore.collection('cocktail').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("cocktail").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Cocktail> cocktails =
        snapshot.map((e) => Cocktail.fromSnapshot(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: <Widget>[
            //     Text(' #청량한 ',
            //         style: TextStyle(
            //             fontFamily: 'NotoSans',
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black54)),
            //     Text(' #청량한 ',
            //         style: TextStyle(
            //             fontFamily: 'NotoSans',
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black54)),
            //     Text(' #청량한 ',
            //         style: TextStyle(
            //             fontFamily: 'NotoSans',
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black54)),
            //   ],
            // ),

            VerticalSpacing(of: 10),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25.0),
              child: Text(
                "오늘의 추천 칵테일   >",
                style: TextStyle(fontSize: 17, color: kBodyTextColor),
              ),
            ),

            VerticalSpacing(
              of: 20,
            ),
            Container(
              height: 310.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: InkWellCard(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      ),
                      child: Container(
                        width: 285,
                        height: 298,
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 220,
                                child: Image.asset(
                                  "assets/images/bluehawaii.png",
                                ),
                              ),
                            ),
                            VerticalSpacing(),
                            Text(
                              '블루하와이',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBodyTextColor),
                            ),
                            VerticalSpacing(),
                            Text(
                              "하와이 해변을 떠오르게하는 색감과\n청량한 맛이 매력적인 칵테일",
                              style: TextStyle(
                                  fontSize: 13, color: kBodyTextColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 25),
                    child: InkWellCard(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      ),
                      child: Container(
                        width: 285,
                        height: 298,
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 220,
                                child: Image.asset(
                                  "assets/images/bluehawaii.png",
                                ),
                              ),
                            ),
                            VerticalSpacing(),
                            Text(
                              "블루하와이",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBodyTextColor),
                            ),
                            VerticalSpacing(),
                            Text(
                              "하와이 해변을 떠오르게하는 색감과\n청량한 맛이 매력적인 칵테일",
                              style: TextStyle(
                                  fontSize: 13, color: kBodyTextColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50, left: 25.0),
              child: Text(
                "이번주 새로운 칵테일   >",
                style: TextStyle(fontSize: 17, color: kBodyTextColor),
              ),
            ),

            VerticalSpacing(of: 20),
            Container(
              height: 310.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: InkWellCard(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      ),
                      child: Container(
                        width: 285,
                        height: 298,
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                  width: 133,
                                  child: Image.asset(
                                      "assets/images/martini2.png")),
                            ),
                            //VerticalSpacing(),
                            Text(
                              "마티니",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBodyTextColor),
                            ),
                            VerticalSpacing(),
                            Text(
                              "칵테일의 왕이라 불리며 드라마 섹스 온더\n비치의 주인공이 즐겨 마시는 칵테일",
                              style: TextStyle(
                                  fontSize: 13, color: kBodyTextColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 25),
                    child: InkWellCard(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      ),
                      child: Container(
                        width: 285,
                        height: 298,
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                  width: 133,
                                  child: Image.asset(
                                      "assets/images/martini2.png")),
                            ),
                            //VerticalSpacing(),
                            Text(
                              "마티니",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kBodyTextColor),
                            ),
                            VerticalSpacing(),
                            Text(
                              "칵테일의 왕이라 불리며 드라마 섹스 온더\n비치의 주인공이 즐겨 마시는 칵테일",
                              style: TextStyle(
                                  fontSize: 13, color: kBodyTextColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(
              of: 20,
            ),
          ],
        ),
      ),
    );
  }
}
