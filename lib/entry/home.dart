import 'package:flutter/material.dart';
import 'package:megalovania/i18n/core/localizations.dart';
import 'package:megalovania/util/local-push-notification/base.dart';

class HomeView extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoreLocalizations.of(context).getText('Megalovania'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            scheduleLocalNotification();
          },
          child: Text("Notification"),
        ),
      ),
    );
  }
}
