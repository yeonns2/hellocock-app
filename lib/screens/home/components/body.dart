import 'package:flutter/material.dart';
import 'package:hellocock/components/cards/card.dart';
import 'package:hellocock/screens/detail/detail_screen.dart';
import 'package:hellocock/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //VerticalSpacing(of: 35),
              const Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' #청량한 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    TextSpan(
                        text: ' #달콤한',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    TextSpan(
                        text: ' #입문자추천',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ],
                ),
              ),
              VerticalSpacing(of: 20),

              InkWellCard(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                ),
                child: Container(
                  width: 330.0,
                  height: 330.0,
                  padding: EdgeInsets.all(150.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bluehawaii2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              VerticalSpacing(of: 35),
              const Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' #묵직한 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    TextSpan(
                        text: ' #무거운',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    TextSpan(
                        text: ' #칵테일마스터',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ],
                ),
              ),
              VerticalSpacing(of: 20),
              InkWellCard(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                ),
                child: Container(
                  width: 330.0,
                  height: 330.0,
                  padding: EdgeInsets.all(150.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/martini2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
