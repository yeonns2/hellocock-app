import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hellocock/screens/splash_screen.dart';
import 'package:hellocock/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initNotiSetting();
  runApp(MyApp());
}

void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid = AndroidInitializationSettings('app_icon');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  final FirebaseMessaging fcm = FirebaseMessaging();
  if (Platform.isIOS) {
    // 권한이 설정되지 않았으면 요청하는 창을 띄움
    fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
  fcm.configure(onMessage: (Map<String, dynamic> message) async {
    print("onMessage: $message");
  }, onResume: (Map<String, dynamic> message) async {
    print("onResume: $message");
  }, onLaunch: (Map<String, dynamic> message) async {
    print("onLaunch: $message");
  });

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hellocock app',
      theme: buildThemeData(),
      home: SplashScreen(),
    );
  }
}
