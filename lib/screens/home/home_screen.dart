import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen(this.user);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (Platform.isIOS) {
      // 권한이 설정되지 않았으면 요청하는 창을 띄움
      fcm.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(widget.user),
    );
  }
}
