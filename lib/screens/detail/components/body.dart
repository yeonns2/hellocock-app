import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:hellocock/screens/detail/components/order_bar.dart';
import 'package:hellocock/screens/detail/components/video_player.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              VideoPlayer(),
              OrderBar(),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "블루하와이",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(of: 20),
                    Text(
                      "하와이 해변을 떠올리게하는 색감과\n청량한 맛에 매력적인 칵테일 이제부터\n푸른 바다향을 느껴봐요!",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 15),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "레시피",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "1.종이컵 두 배 정도 높이가 되고, 너무 \n넓지 않은 투명한 잔을 준비해요.\n2. 얼음잔을 잔에 가득 채우세요. 음료가 얼음\n구석구석을 채워야 원래의 맛을 느낄 수 있어요.\n3. 바카디 양주 하나를 따서 잔에 전부 부어요.\n이건 화이트 럼이라는 술이예요.\n4. 그리고 노란 빛의 태양맛 주스 하나를 열고\n잔에 전부 넣어주세요.\n5. 마지막으로 푸른빛 마법의 하와이 향기를\n반정도 잔에 부어주세요.\n6. 태양과 하와이가 만나 어우러지는 것을\n감상하셨나요? 텀블러에 내용물을 모두 옮겨\n잠그고 마구 흔들어 주세요!",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 15),
                    ),
                    VerticalSpacing(of: 30),
                    Text(
                      "구성품",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(),
                    Image.asset("assets/images/bacardi.jpg"),
                    VerticalSpacing(of: 30),
                    Text(
                      "키트 이미지",
                      style: TextStyle(
                        color: kMainColor,
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpacing(),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Image.asset("assets/images/bacardi.jpg"),
                          Image.asset("assets/images/bacardi.jpg"),
                        ],
                      ),
                    ),
                    VerticalSpacing(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
