import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:megalovania/util/local-push-notification/base.dart';
import 'package:megalovania/util/local-push-notification/static.dart';
import 'package:timezone/timezone.dart';

Future<void> scheduleLocalNotification({
  @required int id,
  @required String title,
  @required String body,
  String payload,
}) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
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
    payload: payload,
  );
}
