import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: 300,
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                child: Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpacing(
                            of: 50,
                          ),
                          Text("헬로 태정"),
                          VerticalSpacing(),
                          Text("mojito@hellock.org")
                        ]),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpacing(),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "수령/배송지 등록",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "계정 연동 / 비밀번호 설정",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "결제 관리",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "취소 /  교환 / 반품 내역",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "상품 리뷰",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "쿠폰",
                    style: TextStyle(fontSize: 12, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing()
              ],
            ),
          )
        ],
      ),
    );
  }
}
