import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backGroundHandler(RemoteMessage event) async {
  print("message recieved! ${event.notification!.title}");
}

class NotificationService {
  static Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backGroundHandler);
      FirebaseMessaging.onMessage.listen(
        (event) {
          print("message recieved! ${event.notification!.title}");
        },
      );
      print("Notification initialized");
    }
  }
}
