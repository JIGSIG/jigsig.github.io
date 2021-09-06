import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:developer/Sound/sound.dart';
import 'package:developer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterStatus extends StatefulWidget {
  @override
  PrinterState createState() => new PrinterState();
}

class PrinterState extends State<PrinterStatus> {
  bool _seen = false;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);
    prefs.setBool('_quest1_available', true);
    if (_seen) {
      return Quest1Title();
    } else {
      await prefs.setBool('seen', true);
      return DevApp();
    }
  }

  void initState() {
    super.initState();
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
            return _seen ? DevApp() : Quest1Title();
          }
        });
  }
}

class Quest1Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(),
          Center(
            child: DefaultTextStyle(
              style: GoogleFonts.ubuntu(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: MediaQuery.of(context).size.width > 850 ? 48 : 22,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                // onFinished: () {
                //   onLoad();
                //   Timer(Duration(milliseconds: 50), () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => DevApp()),
                //     );
                //   });
                // },
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Quête 1 : Rendez-vous au ...',
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                onTap: () {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.arrow_right),
              backgroundColor: Colors.blue,
              onPressed: () {
                onLoad();
                Timer(Duration(milliseconds: 50), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DevApp()),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget questWidget(BuildContext context, int questnumber) {
  return Container(
    child: Align(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: GoogleFonts.ubuntu(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TypewriterAnimatedText(
              'Quête' '$questnumber' ': Rendez-vous au ...',
              speed: const Duration(milliseconds: 30),
            ),
          ],
          onTap: () {},
        ),
      ),
    ),
  );
}
