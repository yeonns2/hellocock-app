import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(
              of: 40,
            ),
            Center(
              child: Text(
                "마이콕은 그동안 마셨던 칵테일을 \n확인할 수 있는 나만의 bar 입니다!\n헬로콕의 칵테일 키트를 통해 \n마이콕을 채워봐요~",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kActiveColor,
                    height: 1.5),
              ),
            ),

            // Row(
            //   children: [
            //     Column(
            //       children: [
            //         SizedBox(
            //             width: 80,
            //             child: Image.asset("assets/images/bluehawaii.png")),
            //         SizedBox(
            //           width: 80,
            //           child: Divider(
            //             thickness: 1.5,
            //             color: kActiveColor,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(
            //               left: 12.5, top: 5, bottom: 10, right: 12.5),
            //           child: Text(
            //             "2020.10.03",
            //             style: TextStyle(color: kActiveColor, fontSize: 10),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         SizedBox(
            //             width: 80,
            //             child: Image.asset("assets/images/bluehawaii.png")),
            //         SizedBox(
            //           width: 80,
            //           child: Divider(
            //             thickness: 1.5,
            //             color: kActiveColor,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(
            //               left: 12.5, top: 5, bottom: 10, right: 12.5),
            //           child: Text(
            //             "2020.10.03",
            //             style: TextStyle(color: kActiveColor, fontSize: 10),
            //           ),
            //         ),
            //       ],
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
