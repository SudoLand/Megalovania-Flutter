import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:megalovania/entry/home.dart';
import 'package:megalovania/i18n/core/localizations.dart';

class EntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        CoreLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      title: 'Megalovania',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      routes: {
        HomeView.route: (context) => HomeView(),
      },
      initialRoute: HomeView.route,
    );
  }
}
