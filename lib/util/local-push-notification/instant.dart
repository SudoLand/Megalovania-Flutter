import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:megalovania/util/local-push-notification/base.dart';
import 'package:megalovania/util/local-push-notification/static.dart';

Future<void> instantLocalNotification() async {
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
    0,
    'plain title',
    'plain body',
    platformChannelSpecifics,
    payload: 'item x',
  );
}
