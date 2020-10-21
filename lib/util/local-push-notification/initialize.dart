import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:megalovania/util/local-push-notification/base.dart';
import 'package:megalovania/util/local-push-notification/static.dart';
import 'package:timezone/timezone.dart';

Future<void> initializeLocalPushNotification() async {
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('app_icon');

  final IOSInitializationSettings iosInitializationSettings =
      IOSInitializationSettings();

  final MacOSInitializationSettings macOSInitializationSettings =
      MacOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
    macOS: macOSInitializationSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<bool> requestPushNotificationPermission() async {
  if (Platform.isIOS) {
    final bool result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    return result;
  }

  if (Platform.isMacOS) {
    final bool result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    return result;
  }

  return true;
}

Future<void> scheduleLocalNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'scheduled title',
    'scheduled body',
    TZDateTime.now(local).add(const Duration(
      seconds: 5,
    )),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        defaultAndroidChannelId,
        defaultAndroidChannelName,
        defaultAndroidChannelDescription,
      ),
    ),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
