import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initializeLocalPushNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
