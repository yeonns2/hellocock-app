import 'package:flutter/material.dart';
import 'package:hellocock/screens/order_completed/order_completed_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "결제 진행",
                style: TextStyle(
                    color: kActiveColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                of: 30,
              ),
              Text(
                "결제금액",
                style: TextStyle(fontSize: 15),
              ),
              VerticalSpacing(
                of: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("주문금액",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Text(
                    "8,900원",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              VerticalSpacing(of: 5),
              Divider(
                thickness: 1.5,
                color: Colors.black54,
              ),
              VerticalSpacing(of: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("총 결제 금액",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  Text(
                    "8,900원",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              VerticalSpacing(of: 50),
              Text(
                "위 내용을 확인하였으며 결제에 동의합니다.",
                style: TextStyle(fontSize: 11.0),
              ),
              VerticalSpacing(of: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "결제수단 선택",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBodyTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(),
              VerticalSpacing(),
              Text("개인정보 제3자 제공"),
              VerticalSpacing(),
              Divider(),
              VerticalSpacing(),
              PrimaryButton(
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderCompletedScreen(),
                  ),
                ),
                text: "8,900원 결제하기",
              ),
              VerticalSpacing(
                of: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
