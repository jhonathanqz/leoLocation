import 'package:flutter/material.dart';
import 'package:location_leo/app/injection_container.dart';
import 'package:location_leo/pages/splash_screen_page.dart';

import 'app/injection_container.dart';

void main() {
  setupDependencies();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'leoLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
    );
  }
}
