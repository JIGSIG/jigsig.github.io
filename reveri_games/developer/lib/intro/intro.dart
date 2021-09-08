import 'package:developer/Quests/Quest1.dart';
import 'package:developer/intro/storyline_intro.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  bool _seen = false;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      return ReverieIntro();
    } else {
      await prefs.setBool('seen', true);
      return QuestPage1();
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
            return _seen ? QuestPage1() : ReverieIntro();
          }
        });
  }
}

class ReverieIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox(
      height: 80,
    );
    Widget reverie = SplashScreenView(
      navigateRoute: EpitechIntro(),
      duration: 5000,
      imageSize: 480,
      imageSrc: "assets/images/intro/reverie.png",
      backgroundColor: Colors.black,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
    return MaterialApp(title: '', home: reverie);
  }
}

class EpitechIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget epitech = SplashScreenView(
      navigateRoute: QuestPage1(),
      duration: 5000,
      imageSize: 230,
      imageSrc: "assets/images/intro/logo-epitech.png",
      backgroundColor: Colors.white,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
    );
    return MaterialApp(title: '', home: epitech);
  }
}
