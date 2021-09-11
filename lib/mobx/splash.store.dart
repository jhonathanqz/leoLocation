import 'package:flutter/material.dart';
import 'package:location_leo/pages/map_page.dart';
import 'package:mobx/mobx.dart';

part 'splash.store.g.dart';

class SplashStore = SplashBase with _$SplashStore;

abstract class SplashBase with Store {
  @action
  Future<void> dismissSplashScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MapPage()),
      (Route<dynamic> route) => false,
    );
  }
}
