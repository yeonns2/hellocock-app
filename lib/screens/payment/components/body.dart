import 'package:flutter/material.dart';
import 'package:hellocock/screens/order_completed/order_completed_screen.dart';
import 'package:hellocock/widgets/buttons/primary_button.dart';
import 'package:hellocock/widgets/cards/card.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> _data = generateItems(8);

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
                style: TextStyle(fontSize: 11),
              ),
              VerticalSpacing(of: 50),
              Text(
                "결제수단 선택",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBodyTextColor,
                  fontSize: 16,
                ),
              ),
              VerticalSpacing(
                of: 20,
              ),
              VerticalSpacing(),
              Row(
                children: [
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "네이버 페이",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "토스 페이",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ],
              ),
              VerticalSpacing(),
              Row(
                children: [
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "페이코 페이",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "카카오 페이",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ],
              ),
              VerticalSpacing(),
              Row(
                children: [
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "핸드폰 결제",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  InkWellCard(
                      circular: 10,
                      onTap: () {},
                      child: Container(
                        width: 133,
                        height: 86,
                        child: Center(
                          child: Text(
                            "무통장 입금",
                            style: TextStyle(
                                fontSize: 13,
                                color: kActiveColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ],
              ),
              VerticalSpacing(of: 30),
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

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {}),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
