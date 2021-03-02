import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
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
                "공지사항",
                textScaleFactor: 1,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ListView(
                shrinkWrap: true,
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ExpansionTile(
                      trailing: SvgPicture.asset("assets/icons/arrow_down.svg"),
                      tilePadding: EdgeInsets.zero,
                      title: Text(
                        "베타서비스 기간 안내",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 13.0,
                            color: kBodyTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                      children: <Widget>[
                        Text(
                          '''
반가워요!
                             
2/15~3/20 한달 간 광진구에서 베타서비스를 시작합니다.

서비스 문의 / 피드백 : pinacolada@hellocock.org 

위 연락처로 연락 주시면 항상 귀기울여 듣고 제품과 서비스 개선에 반영하겠습니다.
''',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 12, color: kBodyTextColor, height: 1.5),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      trailing: SvgPicture.asset("assets/icons/arrow_down.svg"),
                      title: Text(
                        "베타서비스 기념 모히또하우스 이벤트",
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: kBodyTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      children: <Widget>[
                        Text(
                          '''
모히또하우스는 hellocock 이 칵테일을 직접 
만들어먹을 수 있도록 만든 가게입니다. 
딱 한 타임에 한 팀만 들어갈 수 있게 운영되고, 2~4인을 대상으로 편안한 분위기를 제공합니다. 

2/15~3/20 기간 내 칵테일 키트를 구매해준 
모든 친구들에게 모히또하우스 초대권을 드릴게요.

베타서비스 기간 내 저희 서비스를 이용해 주시는 모든 분들께 진심으로 감사드리고, 많은 피드백 부탁드립니다.

*모히또하우스는 100% 초대제와 예약제로 운영됩니다.
''',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 12, color: kBodyTextColor, height: 1.5),
                        ),
                      ],
                    ),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
