import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/widgets/cards/card.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('virgin').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(kActiveColor),
                ),
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
                    (index) => _buildListVirginItem(
                          snapshot.data.docs[index],
                        )));
          },
        ),
      ),
    );
  }

  Widget _buildListVirginItem(DocumentSnapshot document) {
    return Container(
      width: 190,
      height: 300,
      child: InkWellCard(
        circular: 20,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                document['mbti'],
                textScaleFactor: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: kActiveColor),
              ),
              VerticalSpacing(),
              CachedNetworkImage(
                  imageUrl: document['image'],
                  width: 100,
                  fit: BoxFit.fitWidth),
              VerticalSpacing(of: 20),
              Text(
                document['name_eng'],
                textScaleFactor: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kBodyTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
