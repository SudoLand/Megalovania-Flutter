import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool platformPushNotificationAvailable() {
  if (Platform.isIOS || Platform.isAndroid) {
    return true;
  }

  return false;
}
