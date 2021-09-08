import 'dart:async';

import 'package:developer/game_interface/binary10001.dart';
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
      return AccessScreen();
    } else {
      await prefs.setBool('granted', true);
      return LapTopScreen();
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
            return _seen ? LapTopScreen() : AccessScreen();
          }
        });
  }
}

class LapTopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    right:
                        MediaQuery.of(context).size.width > 800 ? 1300 : 500),
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
                                  height:
                                      MediaQuery.of(context).size.width / 20,
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
                                          "assets/images/laptop-icons/Term CMD.ico"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:
                                      MediaQuery.of(context).size.width / 20,
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
                                  height:
                                      MediaQuery.of(context).size.width / 20,
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
              Expanded(child: Container()),
              Row(
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
                            onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
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
                height: MediaQuery.of(context).size.width > 850 ? 90 : 5,
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
                            "assets/images/laptop-icons/Battery.ico"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 20,
                height: 50,
                padding: EdgeInsets.only(left: 50, right: 50),
                child: _AnimatedLiquidLinearProgressIndicator(),
              ),

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
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: Colors.red,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class AccessScreen extends StatelessWidget {
  GlobalKey<ProgressHudState> _hudKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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

  _showLoadingHud(BuildContext context) async {
    ProgressHud.of(context).show(ProgressHudType.loading, "loading...");
    await Future.delayed(const Duration(seconds: 1));
    _hudKey.currentState?.dismiss();
  }

  _showSuccessHud(BuildContext context) {
    ProgressHud.of(context)
        .showAndDismiss(ProgressHudType.success, "Ouverture de la session");
    Future.delayed(const Duration(seconds: 5));
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => LapTopScreen(),
      ),
    );
  }

  _showErrorHud(BuildContext context) {
    ProgressHud.of(context).showAndDismiss(ProgressHudType.error, "load fail");
  }

  _showProgressHud(BuildContext context) {
    var hud = ProgressHud.of(context);
    hud.show(ProgressHudType.progress, "loading");

    double current = 0;
    Timer.periodic(Duration(milliseconds: 1000.0 ~/ 60), (timer) {
      current += 1;
      var progress = current / 100;
      hud.updateProgress(progress, "loading $current%");
      if (progress == 1) {
        hud.showAndDismiss(ProgressHudType.success, "load success");
        timer.cancel();
      }
    });
  }

  _showProgressHudGlobal() {
    ProgressHud.show(ProgressHudType.progress, "loading");

    double current = 0;
    Timer.periodic(Duration(milliseconds: 1000.0 ~/ 60), (timer) {
      current += 1;
      var progress = current / 100;
      ProgressHud.updateProgress(progress, "loading $current%");
      if (progress == 1) {
        ProgressHud.showAndDismiss(ProgressHudType.success, "load success");
        timer.cancel();
      }
    });
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: Container(
        width: double.infinity,
        height: 75.0,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          borderRadius: 12.0,
          center: Text(
            "%",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
