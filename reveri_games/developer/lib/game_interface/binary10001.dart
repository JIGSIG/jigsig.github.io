import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

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
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
  ];
  int oScore = 0;
  int xScore = 0;
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
                    itemCount: 20,
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
                  color: Colors.yellow,
                ),
              ],
            ),
            Container(
              alignment: FractionalOffset.center,
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
      //   if (oTurn && displayElement[index] == '') {
      //     displayElement[index] = 'O';
      //     filledBoxes++;
      //   } else if (!oTurn && displayElement[index] == '') {
      //     displayElement[index] = 'X';
      //     filledBoxes++;
      //   }

      //   oTurn = !oTurn;
      //   _checkWinner();
      // });
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
      // oTurn = !oTurn;
      // _checkWinner();
    });
    _checkWinner();
  }

  void _tapped1(int index) {
    setState(() {
      //   if (oTurn && displayElement[index] == '') {
      //     displayElement[index] = 'O';
      //     filledBoxes++;
      //   } else if (!oTurn && displayElement[index] == '') {
      //     displayElement[index] = 'X';
      //     filledBoxes++;
      //   }

      //   oTurn = !oTurn;
      //   _checkWinner();
      // });
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
      // oTurn = !oTurn;
      // _checkWinner();
    });
    _checkWinner();
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
                        fontSize: 35,
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

  void _checkWinner() {
    // Checking rows
    print(displayElement[1]);
    var columun1 = [
      displayElement[0],
      displayElement[4],
      displayElement[8],
      displayElement[12],
      displayElement[16]
    ];
    var columun2 = [
      displayElement[1],
      displayElement[5],
      displayElement[9],
      displayElement[13],
      displayElement[17]
    ];
    var columun3 = [
      displayElement[2],
      displayElement[6],
      displayElement[10],
      displayElement[14],
      displayElement[18]
    ];
    var columun4 = [
      displayElement[3],
      displayElement[7],
      displayElement[11],
      displayElement[15],
      displayElement[19]
    ];
    Function deepEq = const DeepCollectionEquality().equals;
    /*check Column-1*/
    var C1 = true;
    var C1a = deepEq(columun1, columun2);
    var C1b = deepEq(columun1, columun3);
    var C1c = deepEq(columun1, columun4);
    if (C1a == false && C1b == false && C1c == false)
      C1 = false;
    else
      C1 = true;
    /*check Column-2*/
    var C2 = true;
    var C2a = deepEq(columun2, columun1);
    var C2b = deepEq(columun2, columun3);
    var C2c = deepEq(columun2, columun4);
    if (C2a == false && C2b == false && C2c == false)
      C2 = false;
    else
      C2 = true;
    /*check Column-3*/
    var C3 = true;
    var C3a = deepEq(columun3, columun1);
    var C3b = deepEq(columun3, columun2);
    var C3c = deepEq(columun3, columun4);
    if (C3a == false && C3b == false && C3c == false)
      C3 = false;
    else
      C3 = true;
    /*check Column-4*/
    var C4 = true;
    var C4a = deepEq(columun4, columun1);
    var C4b = deepEq(columun4, columun2);
    var C4c = deepEq(columun4, columun3);
    if (C4a == false && C4b == false && C4c == false)
      C4 = false;
    else
      C4 = true;
    if (C1 == false && C2 == false && C3 == false && C4 == false)
      buildConfettiWidget();
    else
      return;
  }

  Align buildConfettiWidget() {
    return Align(
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
    );
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 20; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
