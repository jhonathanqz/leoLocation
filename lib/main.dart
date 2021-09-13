import 'package:flutter/material.dart';
import 'package:location_leo/app/injection_container.dart';
import 'package:location_leo/pages/splash_screen_page.dart';
import 'package:location_leo/style/app_colors.dart';

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
      title: 'locationFlutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.themeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
    );
  }
}
