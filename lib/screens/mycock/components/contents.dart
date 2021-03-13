import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

class MyCocktail extends StatelessWidget {
  final List order;
  final int index;
  MyCocktail(this.order, this.index);

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('yyyy-MM-dd').format(order[index]['date'].toDate());
    return Container(
      width: 80,
      height: 70,
      child: Row(
        children: [
          Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("cocktail")
                      .where('name',
                          isEqualTo: order[index]['cocktail']['name'])
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    return SizedBox(
                        width: 80,
                        child: Image.asset(snapshot.data.docs[0]['image']));
                  }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  date,
                  textScaleFactor: 1,
                  style: TextStyle(color: kActiveColor, fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
