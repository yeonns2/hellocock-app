import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String title;
  final String content;

  final String action;

  Alert({this.title, this.content, this.action});
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(
        content,
        style: TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        new CupertinoDialogAction(
            child: Text(
              action,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}
