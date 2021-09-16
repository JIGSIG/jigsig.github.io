import 'dart:async';

import 'package:developer/area/office_level_map.dart';
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
                child: AccessScreen(context),
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
                child: LaptopScreen(context),
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
            return _seen ? AccessScreen(context) : LaptopScreen(context);
          }
        });
  }
}

Widget LaptopScreen(BuildContext context) {
  return Scaffold(
//      backgroundColor: Colors.black,
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/laptop-icons/wolf.jpg"),
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
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/laptop-icons/Service.ico"),
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
                                      content: dialogContent(context),
                                    );
                                  },
                                );
                              },
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
                              height: MediaQuery.of(context).size.height > 900
                                  ? MediaQuery.of(context).size.height / 8
                                  : MediaQuery.of(context).size.height / 6,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/laptop-icons/System Information.ico"),
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
                          GestureDetector(
                            onTap: () {
                              print("taped");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/laptop-icons/Microsoft Office Outlook.ico"),
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
                                    content: dialogContent(context),
                                  );
                                },
                              );
                            },
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
                            onTap: () {},
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
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
// Widget gameContent(Widget game, BuildContext context) {
//   return Container(
//     margin: EdgeInsets.only(left: 0.0, right: 0.0),
//     child: Stack(
//       children: <Widget>[
//         Container(
//           width: MediaQuery.of(context).size.width / 1.20,
//           height: MediaQuery.of(context).size.height / 1.15,
//           padding: EdgeInsets.only(
//             top: 18.0,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(16.0),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 0.0,
//                 offset: Offset(0.0, 0.0),
//               ),
//             ],
//           ),
//           child: game,
//         )
//       ],
//     ),
//   );
// }

Widget dialogContent(BuildContext context) {
  var progress = 0.0;
  return Container(
    margin: EdgeInsets.only(left: 0.0, right: 0.0),
    child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.20,
          height: MediaQuery.of(context).size.height / 1.15,
          padding: EdgeInsets.only(
            top: 18.0,
          ),
          margin: EdgeInsets.only(top: 13.0, right: 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width > 850 ? 20 : 1,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    width: MediaQuery.of(context).size.width > 850 ? 250 : 100,
                    height: MediaQuery.of(context).size.width > 850 ? 300 : 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/laptop-icons/Windows Update.ico"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width > 850 ? 40 : 10,
              ),
              UpdateScreenState(),

              // InkWell(
              //   child: Container(
              //     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(16.0),
              //           bottomRight: Radius.circular(16.0)),
              //     ),
              //     child: LiquidLinearProgressIndicator(),
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // )
            ],
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
            child: LaptopScreen(context),
          );
        },
      ),
    ),
  );
}

Widget AccessScreen(BuildContext context) {
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
                image: AssetImage("assets/images/laptop-icons/access.png"),
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

class UpdateScreenState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UpdateScreen();
}

class UpdateScreen extends State<UpdateScreenState>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Timer? timer;
  int a = 0;
  var percentage;

  bool _UpdateDone = false;

  List<String> list = [
    "Lancement de l'Analyse de Sécurité.",
    "Téléchargement des données de Mises à Jour...",
    "Mise en place des Mises à jour de Sécurité...",
    "Analyse Complète"
  ];

  var max;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
    _animationController.addListener(() => setState(() {
          var f = _animationController.value * 100;
          max = f.toStringAsFixed(0);
          if (max == "100") {
            _animationController.stop();
            _save();
          }
        }));
    _animationController.repeat();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => a++);
    timer = Timer.periodic(Duration(microseconds: 1), (Timer t) => _checker());
  }

  Future<bool> _read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('UpdateDone') ?? false;
    return boolValue;
  }

  void _checker() async {
    bool value = await _read();
    if (value == true)
      setState(() {
        _UpdateDone = true;
      });
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'UpdateDone';
    prefs.setBool(key, true);
    _UpdateDone = true;
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    percentage = _animationController.value * 100;
    return Center(
        child: Column(
      children: [
        Text(
          _UpdateDone ? "Analyse Complète" : list[a > 3 ? list.length - 1 : a],
          style: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: MediaQuery.of(context).size.width > 850 ? 20 : 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 850 ? 40 : 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width > 850
              ? MediaQuery.of(context).size.width / 1.5
              : double.infinity,
          height: MediaQuery.of(context).size.width > 850
              ? MediaQuery.of(context).size.height / 13
              : 30.01,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: LiquidLinearProgressIndicator(
            value: _UpdateDone ? 100.00 : _animationController.value,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            borderRadius: 12.0,
            center: Text(
              _UpdateDone ? "100%" : "${percentage.toStringAsFixed(0)}%",
              style: GoogleFonts.ubuntu(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: MediaQuery.of(context).size.width > 850 ? 20 : 15,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 850 ? 40 : 20,
        ),
        Center(
          child: _UpdateDone
              ? Text(
                  "Votre sytème et vos services de sécurité sont à jour et prêt",
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: MediaQuery.of(context).size.width > 850 ? 20 : 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                )
              : Text(
                  "Mise à Jour en cours . . .",
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: MediaQuery.of(context).size.width > 850 ? 20 : 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
        ),
      ],
    ));
  }
}
