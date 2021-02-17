import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trevi_assignment/pages/game_page.dart';
import 'package:trevi_assignment/pages/initialize_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.dark(),
      supportedLocales: [
        const Locale('zh', 'TW'),
        const Locale('en', 'US'),
      ],
      title: 'Trevi Assignment by AriZhong',
      initialRoute: InitializePage.routeName,
      routes: {
        InitializePage.routeName: (context) => InitializePage(), //輸入畫面
        GamePage.routeName: (context) => GamePage(), //產生畫面
      },
    );
  }
}
