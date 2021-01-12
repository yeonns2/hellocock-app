import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/order/order_screen.dart';
import 'package:hellocock/size_config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MenuPanel extends StatefulWidget {
  @override
  _MenuPanelState createState() => _MenuPanelState();
}

class _MenuPanelState extends State<MenuPanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 300,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(20)),
      panelBuilder: (ScrollController sc) => _panel(sc),
    );
  }

  Widget _panel(ScrollController sc) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
              ],
            ),
          ],
        ));
  }

  Widget store() {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/store.png"),
            HorizontalSpacing(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '궤도에 오르다',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  '어린이대공원역 3번 출구 근처 \n맥주안주와 식사대용으로 좋은 \n수제핫도그 전문점',
                  style: TextStyle(fontSize: 12),
                ),
                VerticalSpacing(),
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
                        onPressed: () {},
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
                            builder: (context) => OrderScreen(),
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
