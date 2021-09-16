import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:developer/game_interface/binary10001.dart';
import 'package:developer/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class AccessGranted extends StatefulWidget {
  @override
  AcessState createState() => new AcessState();
}

class AcessState extends State<AccessGranted> {
  bool _seen = false;
  Future checkAccessStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('granted') ?? false);
    if (_seen) {
      return showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: AccessScreen2(context),
              );
            },
          ),
        ),
      );
    } else {
      await prefs.setBool('granted', true);
      return showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: LaptopScreen2(context),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkAccessStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _seen ? AccessScreen2(context) : LaptopScreen2(context);
          }
        });
  }
}

Widget LaptopScreen2(BuildContext context) {
  return Scaffold(
//      backgroundColor: Colors.black,
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/laptop-icons/skrull.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width > 800 ? 1300 : 500),
              child: Container(
                width: MediaQuery.of(context).size.width / 15,
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4.0,
                  direction: Axis.vertical,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      elevation: 0.0,
                                      backgroundColor: Colors.transparent,
                                      content: NotYourBuisness(context),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/laptop-icons/Folder Yellow Android.ico"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width / 20,
                                height: MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height > 900
                                  ? MediaQuery.of(context).size.height / 8
                                  : MediaQuery.of(context).size.height / 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      elevation: 0.0,
                                      backgroundColor: Colors.transparent,
                                      content: NotYourBuisness(context),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/laptop-icons/Folder Yellow Settings.ico"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width / 20,
                                height: MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height > 900
                                  ? MediaQuery.of(context).size.height / 8
                                  : MediaQuery.of(context).size.height / 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        BinaryMiniGame(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/laptop-icons/Mime Config.ico"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width / 20,
                                height: MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: FractionalOffset.center,
                      color: Color.fromRGBO(220, 227, 245, 0.5),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height > 900
                          ? MediaQuery.of(context).size.height
                          : MediaQuery.of(context).size.height / 10,
                      child: new Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    elevation: 0.0,
                                    backgroundColor: Colors.transparent,
                                    content: makeYourChoice(context, 0),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/laptop-icons/Windows.ico"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height > 900
                                ? MediaQuery.of(context).size.height / 1.15
                                : MediaQuery.of(context).size.height / 2,
                            child: Padding(
                              padding: MediaQuery.of(context).size.width > 900
                                  ? EdgeInsets.only(top: 12.0, left: 20.0)
                                  : EdgeInsets.only(left: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Rechercher",
                                  fillColor: Colors.black,
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width > 900
                                  ? 65
                                  : 25),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/laptop-icons/Windows Update.ico"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width > 900
                                  ? 65
                                  : 25),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    elevation: 0.0,
                                    backgroundColor: Colors.transparent,
                                    content: NotYourBuisness(context),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/laptop-icons/Windows Defender.ico"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width > 900
                                  ? 65
                                  : 25),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/laptop-icons/user.ico"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget makeYourChoice(BuildContext context, int index) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width > 850
          ? MediaQuery.of(context).size.width / 1.20
          : MediaQuery.of(context).size.width / 1.20,
      height: MediaQuery.of(context).size.width > 850
          ? MediaQuery.of(context).size.height / 5
          : MediaQuery.of(context).size.height / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => DevApp(),
              //   ),
              // );
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width > 850
                  ? MediaQuery.of(context).size.width / 5
                  : MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width > 850
                  ? MediaQuery.of(context).size.height / 5
                  : MediaQuery.of(context).size.height / 7,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    padding: MediaQuery.of(context).size.width > 850
                        ? EdgeInsets.only(bottom: 70, right: 72)
                        : EdgeInsets.zero,
                    child: IconButton(
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.lightBlue,
                        size:
                            MediaQuery.of(context).size.width > 850 ? 100 : 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > 850 ? 10 : 10,
          ),
          GestureDetector(
            onTap: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 3);
            },
            child: Container(
              width: MediaQuery.of(context).size.width > 850
                  ? MediaQuery.of(context).size.width / 5
                  : MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width > 850
                  ? MediaQuery.of(context).size.height / 5
                  : MediaQuery.of(context).size.height / 7,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    padding: MediaQuery.of(context).size.width > 850
                        ? EdgeInsets.only(bottom: 70, right: 72)
                        : EdgeInsets.zero,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.red,
                        size:
                            MediaQuery.of(context).size.width > 850 ? 100 : 25,
                      ),
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 3);
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

_showSuccessHud(BuildContext context) {
  ProgressHud.of(context)
      .showAndDismiss(ProgressHudType.success, "Ouverture de la session");
  Future.delayed(const Duration(seconds: 5));
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Builder(
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LaptopScreen2(context),
          );
        },
      ),
    ),
  );
}

Widget AccessScreen2(BuildContext context) {
  GlobalKey<ProgressHudState> _hudKey = GlobalKey();
  var submitTextStyle = GoogleFonts.nunito(
      fontSize: MediaQuery.of(context).size.width < 900 ? 15 : 28,
      letterSpacing: 5,
      color: Colors.white,
      fontWeight: FontWeight.w300);
  return Scaffold(
    body: ProgressHud(
      key: _hudKey,
      maximumDismissDuration: Duration(seconds: 2),
      child: Center(
        child: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/laptop-icons/skrull.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Code d'accès",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.code,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  onPress: () {
                    _showSuccessHud(context);
                  },
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.75,
                  text: "Rentrez vos codes d'accès",
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  textStyle: submitTextStyle,
                  backgroundColor: Colors.lightBlue,
                  selectedBackgroundColor: Colors.lightGreen,
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: 50,
                ),
              ],
            ),
          );
        }),
      ),
    ),
  );
}

Widget NotYourBuisness(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Opacity(
        opacity: 1,
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white), color: Colors.black),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 5,
            child: Row(
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: MediaQuery.of(context).size.width > 850 ? 17 : 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      onFinished: () {
                        Future.delayed(const Duration(microseconds: 10), () {
                          Navigator.pop(context);
                        });
                      },
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Ça, c'est pas tes affaires l'ami...",
                          speed: Duration(milliseconds: 50),
                        ),
                      ],
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
