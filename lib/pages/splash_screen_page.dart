import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:location_leo/app/injection_container.dart';
import 'package:location_leo/mobx/map.store.dart';
import 'package:location_leo/mobx/splash.store.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    sl<MapStore>().latDevice = -21.248402;
    sl<MapStore>().lngDevice = -48.485076;
    sl<MapStore>().getCurrentLocation();
    sl<MapStore>().getAddressUser();
    sl<SplashStore>().dismissSplashScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[800],
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              curve: Curves.elasticOut,
              child: Center(
                child: Icon(
                  Icons.near_me,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              curve: Curves.elasticOut,
              child: Center(
                child: Text(
                  'Location Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
