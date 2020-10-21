import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:megalovania/util/local-push-notification/base.dart';
import 'package:megalovania/util/local-push-notification/static.dart';

Future<void> instantLocalNotification({
  @required int id,
  @required String title,
  @required String body,
  String payload,
}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    defaultAndroidChannelId,
    defaultAndroidChannelName,
    defaultAndroidChannelDescription,
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    body,
    platformChannelSpecifics,
    payload: payload,
  );
}
