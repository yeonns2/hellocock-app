import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacing(
            of: 20,
          ),
          Text(
            "  푸시 알림",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: kBodyTextColor),
          ),
          VerticalSpacing(),
          Container(
              margin: EdgeInsets.zero,
              width: 325,
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xFFF4FBFE),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text(
                  "헬로콕 앱에서 보내는 알림을 받을 수 있습니다. 알림에 관한 설정은 \n'설정 앱>알림>헬로콕'에서 변경할 수 있습니다.",
                  style: TextStyle(fontSize: 10, height: 1.5),
                ),
              )),
          VerticalSpacing(of: 30),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "  광고성 정보 수신 동의",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kBodyTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AdvancedSwitch(
                  width: 32.0,
                  height: 16.0,
                  value: _value,
                  onChanged: (bool newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                  activeColor: kActiveColor,
                ),
              ),
            ],
          ),
          VerticalSpacing(),
          Container(
              margin: EdgeInsets.zero,
              width: 325,
              height: 39,
              decoration: BoxDecoration(
                color: Color(0xFFF4FBFE),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20, top: 11),
                child: Text(
                  "신규 서비스 및 고객 맞춤 혜택 정보를 받을 수 있습니다.",
                  style: TextStyle(fontSize: 10, height: 1.5),
                ),
              )),
        ],
      ),
    ));
  }
}
