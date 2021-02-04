import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/detail/detail_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:hellocock/widgets/cards/card.dart';

class Body extends StatelessWidget {
  final User user;
  Body(this.user);
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
                  "좋아요",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              VerticalSpacing(of: 30),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('cocktail')
                      .where('likedUsers', arrayContains: user.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data.docs.length == 0) {
                      return Text(
                        "좋아하는 칵테일이 없어요..",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kBodyTextColor,
                            height: 1.5),
                      );
                    }
                    return GridView.count(
                        shrinkWrap: true, // You won't see infinite size error
                        primary: false,
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        padding: const EdgeInsets.all(20.0),
                        crossAxisSpacing: 10.0,
                        children: List.generate(
                            snapshot.data.docs.length,
                            (index) => _buildListItem(
                                snapshot.data.docs[index], index, context)));
                  }),
            ]),
      ),
    );
  }

  Widget _buildListItem(
      DocumentSnapshot document, int index, BuildContext context) {
    return InkWellCard(
      circular: 30,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(user, document)),
        );
      },
      child: Container(
        width: 154,
        height: 261,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 200, child: Image.asset(document['image'])),
            VerticalSpacing(),
            Text(
              document['name_eng'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kBodyTextColor),
            ),
            VerticalSpacing(
              of: 20,
            ),
            Icon(
              Icons.favorite,
              color: kActiveColor,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
