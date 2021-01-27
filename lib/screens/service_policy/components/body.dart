import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VerticalSpacing(
                of: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "   1. 수집하는 개인정보의 항목, 수집∙이용목적 및 수집방법",
                    style: TextStyle(fontSize: 11),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 311,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "1-1. 주문시\n수집항목 : 성명, 휴대전화, 주소, 우편번호\n수집∙이용목적 : 주문상품\n수집방법: 헬로콕은 홈페이지에서 주문 시 배송을 위한 개인정보 수집 및\n이용에 대해 「동의」 버튼을 클릭할 수 있는 절차를 마련하고, 고객이\n「동의」 버튼을 클릭 시 개인정보 수집 및 이용에 동의한 것으로 간주합니다.\n\n1-2. 문의 시\n수집항목: 성명, 휴대전화, 주문내역, 결제내역\n수집∙이용목적: 고객의 불만사항 및 및 문의사항에 대한 답변\n수집방법: **헬로콕**은 가입 시 고객 응대를 위해 개인정보 제공에 대해\n동의여부 절차를 마련하고, 고객이 「동의」 버튼 클릭 시 개인정보 수집 및\n 이용에 동의한 것으로 간주합니다.\n\n1-3. 회원가입 시\n수집항목: 전화번호, 카카오 계정, 생일, 출생연도, 연령대, 성별\n수집방법: 헬로콕은 앱에서 고객이 회원 가입하기 버튼 클릭 시,\n휴대폰 본인 인증 또는 카카오 계정으로 로그인 기능을 통해 회원가입할 \n수 있는 절차를 마련합니다.",
                          style: TextStyle(fontSize: 10),
                        ),
                      )),
                ],
              ),
            ]),
      ),
    );
  }
}
