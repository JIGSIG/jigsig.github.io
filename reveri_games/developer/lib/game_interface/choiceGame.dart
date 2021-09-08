import 'package:developer/intro/intro.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceGame extends StatefulWidget {
  ChoiceGameChecker createState() => ChoiceGameChecker();
}

class ChoiceGameChecker extends State<ChoiceGame> {
  bool _seen = false;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      return Splash();
    } else {
      await prefs.setBool('seen', true);
      return ChoiceGameChecker();
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
            return _seen ? Splash() : ChoiceGameWidget();
          }
        });
  }
}

class ChoiceGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var submitTextStyle = GoogleFonts.ubuntu(
        fontSize: MediaQuery.of(context).size.width < 800 ? 12 : 20,
        letterSpacing: MediaQuery.of(context).size.width < 800 ? 2 : 5,
        color: Colors.black,
        fontWeight: FontWeight.w300);
    return Scaffold(
//      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("images/back.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width < 950
                              ? MediaQuery.of(context).size.width
                              : MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        // padding: EdgeInsets.only(
                                        //     left: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width >
                                        //             850
                                        //         ? 170
                                        //         : 90),
                                        child: Text(
                                          '{Dévéloppeur}',
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      800
                                                  ? 45
                                                  : 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 90),
                                          child: AnimatedButton(
                                            onPress: () {
                                              Navigator.of(context)
                                                  .push(_createRoute());
                                            },
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    820
                                                ? 150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.2,
                                            text: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    950
                                                ? 'Commencez votre Aventure'
                                                : 'Commencez',
                                            isReverse: true,
                                            selectedTextColor: Colors.black,
                                            transitionType:
                                                TransitionType.LEFT_TO_RIGHT,
                                            textStyle: submitTextStyle,
                                            backgroundColor: Colors.white,
                                            borderColor: Colors.black,
                                            borderRadius: 50,
                                            borderWidth: 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 90),
                                          child: AnimatedButton(
                                            onPress: () {
                                              Navigator.of(context)
                                                  .push(_createRoute());
                                            },
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    820
                                                ? 150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.2,
                                            text: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    950
                                                ? 'Commencez votre Aventure'
                                                : 'Commencez',
                                            isReverse: true,
                                            selectedTextColor: Colors.black,
                                            transitionType:
                                                TransitionType.LEFT_TO_RIGHT,
                                            textStyle: submitTextStyle,
                                            backgroundColor: Colors.blueAccent,
                                            borderColor: Colors.white,
                                            borderRadius: 50,
                                            borderWidth: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.zero,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Text(
                                          'Chef de Projet Digital',
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: .5,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      800
                                                  ? 45
                                                  : 25,
                                            ),
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ReverieIntro(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
