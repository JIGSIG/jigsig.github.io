import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BinaryMiniGame extends StatefulWidget {
  @override
  _BinaryMiniGameState createState() => _BinaryMiniGameState();
}

class _BinaryMiniGameState extends State<BinaryMiniGame> {
  bool oTurn = true;
  ConfettiController _controllerTopCenter =
      ConfettiController(duration: const Duration(seconds: 10));
  // 1st player is O
  List<String> displayElement = [
    '0',
    '0',
    '',
    '',
    '0',
    '',
    '',
    '1',
    '',
    '0',
    '1',
    '',
    '',
    '',
    '',
    '0',
  ];
  List<String> mapclear = [
    '0',
    '0',
    '',
    '',
    '0',
    '',
    '',
    '1',
    '',
    '0',
    '1',
    '',
    '',
    '',
    '',
    '0',
  ];
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.width / 2.75
                      : MediaQuery.of(context).size.width / 2.85,
                  height: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.height / 3
                      : MediaQuery.of(context).size.height / 3,
                  color: Colors.blue,
                  child: IconButton(
                    icon: Icon(
                      Icons.light_mode,
                      color: Colors.yellow,
                      size: MediaQuery.of(context).size.width > 850 ? 100 : 25,
                    ),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            elevation: 0.0,
                            backgroundColor: Colors.transparent,
                            content: Hint(context),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.height / 1.10
                      : MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: 16,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 4),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                elevation: 0.0,
                                backgroundColor: Colors.transparent,
                                content: makeYourChoice(context, index),
                              );
                            },
                          );
                          // _tapped(index);
                        },
                        child: Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                displayElement[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.width / 2.60
                      : MediaQuery.of(context).size.width / 3.17,
                  height: MediaQuery.of(context).size.width > 850
                      ? MediaQuery.of(context).size.height / 3
                      : MediaQuery.of(context).size.height / 3,
                  color: Colors.black,
                  child: IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                      size: MediaQuery.of(context).size.width > 850 ? 100 : 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Container(
              alignment: FractionalOffset.bottomCenter,
              color: Color.fromRGBO(220, 227, 245, 0.5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height > 900
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height / 10,
              child: new RaisedButton(
                color: Colors.indigo[50],
                textColor: Colors.black,
                onPressed: _clearScoreBoard,
                child: Text("Clear Score Board"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped0(int index) {
    setState(() {
      if (displayElement[index] == '0') {
        displayElement[index] = '';
        filledBoxes++;
      } else if (displayElement[index] == '') {
        displayElement[index] = '0';
        filledBoxes++;
      } else if (displayElement[index] == '1') {
        displayElement[index] = '0';
        filledBoxes++;
      }
    });
    _checkWinner();
  }

  void _tapped1(int index) {
    setState(() {
      if (displayElement[index] == '1') {
        displayElement[index] = '';
        filledBoxes++;
      } else if (displayElement[index] == '') {
        displayElement[index] = '1';
        filledBoxes++;
      } else if (displayElement[index] == '0') {
        displayElement[index] = '1';
        filledBoxes++;
      }
    });
    _checkWinner();
  }

  Widget Hint(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width > 850
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.width > 850
                ? MediaQuery.of(context).size.height / 2
                : MediaQuery.of(context).size.height / 1.1,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    // DefaultTextStyle(
                    //   style: GoogleFonts.ubuntu(
                    //     textStyle: Theme.of(context).textTheme.headline4,
                    //     fontSize:
                    //         MediaQuery.of(context).size.width > 850 ? 17 : 13,
                    //     fontWeight: FontWeight.w700,
                    //     color: Colors.black,
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 50, right: 50),
                    //     child: AnimatedTextKit(
                    //       totalRepeatCount: 1,
                    //       onFinished: () {
                    //         Future.delayed(const Duration(microseconds: 10),
                    //             () {
                    //           Navigator.pop(context);
                    //         });
                    //       },
                    //       animatedTexts: [
                    //         TypewriterAnimatedText(
                    //           "Sudoku Binaire...\n",
                    //           speed: Duration(milliseconds: 50),
                    //         ),
                    //       ],
                    //       onTap: () {},
                    //     ),
                    //   ),
                    // ),
                    Text(
                      "Sudoku Binaire",
                      style: GoogleFonts.ubuntu(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize:
                            MediaQuery.of(context).size.width > 850 ? 20 : 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width > 850 ? 40 : 20,
                    ),
                    Text(
                      "Dans ce puzzle, il n'y a que des zéros et des uns, certaines cellules sont déjà remplies, le reste doit être rempli par vous. Votre objectif est de déterminer quelles cellules sont des zéros et lesquelles sont des uns.",
                      style: GoogleFonts.ubuntu(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize:
                            MediaQuery.of(context).size.width > 850 ? 20 : 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Chaque puzzle doit être résolu selon les règles suivantes :\n\n* Chaque cellule doit contenir zéro ou un.\n* Pas plus de deux numéros similaires ci-dessous ou côte à côte sont autorisés.\n* Chaque ligne et colonne doit contenir un nombre égal de zéros et de uns.\n* Chaque ligne est unique et chaque colonne est unique.\n\nChaque puzzle n'a qu'une seule solution. Vous pouvez toujours trouver cette solution sans deviner.",
                      style: GoogleFonts.ubuntu(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize:
                            MediaQuery.of(context).size.width > 850 ? 20 : 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _tapped0(index);
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
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width > 850 ? 50 : 80,
            ),
            GestureDetector(
              onTap: () {
                _tapped1(index);
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
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.black, fontSize: 35),
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

  _checkWinner() {
    // Checking rows
    if (displayElement[2] == '1' &&
        displayElement[3] == '1' &&
        displayElement[5] == '1' &&
        displayElement[6] == '0' &&
        displayElement[8] == '1' &&
        displayElement[11] == '0' &&
        displayElement[12] == '1' &&
        displayElement[13] == '1' &&
        displayElement[14] == '0') {
      print("Win");
      Future.delayed(Duration(seconds: 1));
      int count = 0;
      Navigator.of(context).popUntil((_) => count++ >= 3);
      // showDialog(
      //   context: context,
      //   builder: (_) => new AlertDialog(
      //     contentPadding: EdgeInsets.zero,
      //     content: Builder(
      //       builder: (context) {
      //         return Container(
      //           width: MediaQuery.of(context).size.width,
      //           height: MediaQuery.of(context).size.height,
      //           child: Align(
      //             alignment: Alignment.topCenter,
      //             child: ConfettiWidget(
      //               minimumSize: Size(10, 5),
      //               maximumSize: Size(20, 15),
      //               shouldLoop: false,
      //               confettiController: _controllerTopCenter,
      //               blastDirection: pi / 2,
      //               blastDirectionality: BlastDirectionality.explosive,
      //               emissionFrequency: .5,
      //               numberOfParticles: 10, // a lot of particles at once
      //               gravity: .3,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // );
    }
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
                      fontSize:
                          MediaQuery.of(context).size.width > 850 ? 17 : 13,
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

  buildConfettiWidget() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Builder(
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  minimumSize: Size(10, 5),
                  maximumSize: Size(20, 15),
                  shouldLoop: false,
                  confettiController: _controllerTopCenter,
                  blastDirection: pi / 2,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: .5,
                  numberOfParticles: 10, // a lot of particles at once
                  gravity: .3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _clearBoard() {
    setState(() {
      displayElement = List.from(mapclear);
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      displayElement = List.from(mapclear);
    });
    filledBoxes = 0;
  }
}
