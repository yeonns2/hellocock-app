import 'package:flutter/material.dart';

import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                height: 250,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HorizontalSpacing(
                      of: 30,
                    ),
                    CircleAvatar(
                      radius: 56,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[200],
                      // child: SvgPicture.asset(
                      //   "assets/images/taejung.svg",
                      // ),
                    ),
                    HorizontalSpacing(
                      of: 40,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpacing(
                            of: 30,
                          ),
                          Text(
                            "헬로 태정",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          VerticalSpacing(),
                          Text("mojito@hellock.org",
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          VerticalSpacing(
                            of: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("좋아요",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: kActiveColor)),
                                  VerticalSpacing(),
                                  Text("5",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: kBodyTextColor)),
                                ],
                              ),
                              HorizontalSpacing(),
                              Column(
                                children: [
                                  Text("주문 내역",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: kActiveColor)),
                                  VerticalSpacing(),
                                  Text("200",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: kBodyTextColor)),
                                ],
                              ),
                              HorizontalSpacing(),
                              Column(
                                children: [
                                  Text("수령 대기",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: kActiveColor)),
                                  VerticalSpacing(),
                                  Text("1",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: kBodyTextColor)),
                                ],
                              ),
                            ],
                          )
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
                    style: TextStyle(fontSize: 14, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "계정 연동 / 비밀번호 설정",
                    style: TextStyle(fontSize: 14, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "결제 관리",
                    style: TextStyle(fontSize: 14, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "취소 /  교환 / 반품 내역",
                    style: TextStyle(fontSize: 14, color: kBodyTextColor),
                  ),
                ),
                VerticalSpacing(of: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
