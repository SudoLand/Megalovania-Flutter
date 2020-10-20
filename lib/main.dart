import 'package:flutter/material.dart';
import 'package:megalovania/entry/entry.dart';
import 'package:megalovania/util/local-push-notification.dart';

Future<void> main() async {
  final Widget entry = EntryView();

  WidgetsFlutterBinding.ensureInitialized();

  await initializeLocalPushNotification();

  runApp(entry);
}
