import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../main.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  void initState() {
    if (!kIsWeb) {
      Flame.device.setLandscape();
      Flame.device.fullScreen();
    }
    super.initState();
  }

  bool _seen = false;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      return ReverieIntro();
    } else {
      await prefs.setBool('seen', true);
      return DevApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _seen ? DevApp() : ReverieIntro();
          }
        });
  }
}

class ReverieIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget reverie = SplashScreenView(
      navigateRoute: EpitechIntro(),
      duration: 5000,
      imageSize: 230,
      imageSrc: "assets/images/intro/reverie.png",
      backgroundColor: Colors.black,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: '', home: reverie);
  }
}

class EpitechIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget epitech = SplashScreenView(
      navigateRoute: DevApp(),
      duration: 5000,
      imageSize: 230,
      imageSrc: "assets/images/intro/logo-epitech.png",
      backgroundColor: Colors.white,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: '', home: epitech);
  }
}
