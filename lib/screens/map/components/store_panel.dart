import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/menu/menu_screen.dart';
import 'package:hellocock/screens/order/order_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StorePanel extends StatefulWidget {
  final User user;
  final DocumentSnapshot cocktaildocument;
  StorePanel(this.user, this.cocktaildocument);
  @override
  _StorePanelState createState() => _StorePanelState();
}

class _StorePanelState extends State<StorePanel> {
  PanelController _pc1 = new PanelController();
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _pc1,
        minHeight: 300,
        maxHeight: 600,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(20)),
        panelBuilder: (ScrollController sc) => _buildpanel1(sc));
  }

  Widget _buildpanel1(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            VerticalSpacing(
              of: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 3.5,
                  decoration: BoxDecoration(
                      color: Color(0xFF6F6F6F),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            VerticalSpacing(
              of: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 40.0),
              child: Text(
                "픽업 장소 및 시간",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: kActiveColor),
              ),
            ),
            Container(
              width: 200,
              height: 1000,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('store')
                      .orderBy('name')
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
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildListStore(snapshot.data.docs[index]);
                      },
                    );
                  }),
            ),
          ],
        ));
  }

  Widget _buildListStore(DocumentSnapshot document) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(document['image']),
            HorizontalSpacing(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  document['explain'].replaceAll("\\n", "\n"),
                  style: TextStyle(fontSize: 11),
                ),
                Text(
                  document['opening_hours'],
                  style: TextStyle(fontSize: 11),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: RaisedButton(
                        child: Text(
                          "안주보기",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenuScreen(widget.cocktaildocument, document),
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    HorizontalSpacing(
                      of: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: RaisedButton(
                        child: Text(
                          "수령하기",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScreen(document),
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
