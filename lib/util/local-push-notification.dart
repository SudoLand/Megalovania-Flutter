import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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

Future<void> displayLocalNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'id',
    'channel',
    'description',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'plain title',
    'plain body',
    platformChannelSpecifics,
    payload: 'item x',
  );
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
        'id',
        'name',
        'description',
      ),
    ),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
