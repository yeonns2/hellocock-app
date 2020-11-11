import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hellocock"),
      ),
      body: Body(),
    );
  }
}
