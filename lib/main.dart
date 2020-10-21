import 'package:flutter/material.dart';
import 'package:megalovania/entry/entry.dart';
import 'package:megalovania/util/local-push-notification/base.dart';
import 'package:megalovania/util/timezone.dart';

Future<void> main() async {
  final Widget entry = EntryView();

  WidgetsFlutterBinding.ensureInitialized();

  await initializeLocalPushNotification();
  initializeTimeConfig();

  runApp(entry);
}
