import 'package:flutter/material.dart';
import '../../../../size_config.dart';

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
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Text(
                          '''
1. 개인정보 제3자 제공 동의

회사는 회원님께서 주문하신 상품의 결제 및 픽업 서비스 제공을 위해 아래와 같이 제3자에게 정보를 제공합니다.
- 제공 받는자 : 동봉된 주류 도매사, hellocock, 수령하는 매장 (픽업 매장)
- 목적 : 픽업 서비스의 이용 계약 이행
- 항목 : 주문 정보, 구매자와 수령자 정보 (이름, 전화번호, 생년월일, 주문 위치)
- 기간 : 마이콕 등록 (구매확정) 후 3개월까지

2. 이용 정책

- 미성년자는 구매할 수 없습니다.
- 매장 수령 시 수령자는 신분증을 지참해야 합니다.
- 주문과 관련하여 이상 상황이 발생하는 경우, hellocock은 고객에게 고지하고 고객은 이전에 주문했던 내용에 대해 취소를 요청할 수 있습니다.
- 취소 문의는 고객센터 ( 070-8098-2267 )로 최대한 빠르게 연락 주세요.
- 칵테일 키트의 경우, 픽업 매장으로 키트 배송이 이루어지므로, 배송 출발 이후 주문 취소 시 키트 비용에 대한 패널티가 있을 수 있습니다.
- 음식을 함께 주문하는 경우, 음식 조리 이후 주문 취소 시, 음식 비용에 해당하는 비용을 환불받을 수 없습니다.
- 칵테일 키트에 대한 철약철회방침은 별도로 제공합니다.

                          ''',
                          textScaleFactor: 1,
                          style: TextStyle(fontSize: 10, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 10),
                ],
              ),
            ]),
      ),
    );
  }
}
