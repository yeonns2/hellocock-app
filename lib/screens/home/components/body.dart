import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/widgets/cards/card.dart';
import 'package:hellocock/screens/detail/detail_screen.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  final User user;

  Body(this.user);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('cocktail')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(kActiveColor),
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildListItem(snapshot.data.docs[index], index);
                      },
                    );
                  }),
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('cocktail')
                      .where('name', isEqualTo: '피치 크러쉬')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(kActiveColor),
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildListItem(snapshot.data.docs[index], index);
                      },
                    );
                  }),
            ),
            VerticalSpacing(
              of: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(DocumentSnapshot document, int index) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: InkWellCard(
        circular: 30,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(widget.user, index),
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
                child:
                    SizedBox(width: 200, child: Image.asset(document['image'])),
              ),
              Text(
                document['name'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kBodyTextColor),
              ),
              VerticalSpacing(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  document['explain'],
                  style: TextStyle(fontSize: 13, color: kBodyTextColor),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
