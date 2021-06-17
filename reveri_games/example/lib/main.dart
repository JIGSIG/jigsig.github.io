// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:bonfire/bonfire.dart';
import 'package:example/game_tiled_map.dart';
import 'package:example/manual_map/game_manual_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

String getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return "Ios";
  if (userAgent.contains("ipad")) return "Ios";
  if (userAgent.contains("android")) return "Android";
  return "Web";
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb || getOSInsideWeb() != 'Web') {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CheckOrientation(toDisplay: Menu()),
  ));
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Bonfire',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text('Manual Map'),
                onPressed: () {
                  if (getOSInsideWeb() == 'Ios')
                    SystemChrome.setEnabledSystemUIOverlays([]);
                  else
                    document.documentElement!.requestFullscreen();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameManualMap()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text('Tiled Map'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CheckOrientation(toDisplay: GameTiledMap()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        child: Center(
          child: Text(
            'Keyboard: directional and Space Bar to attack',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class CheckOrientation extends StatefulWidget {
  final Widget toDisplay;

  const CheckOrientation({Key? key, required this.toDisplay}) : super(key: key);

  @override
  _CheckOrientationState createState() => _CheckOrientationState();
}

class _CheckOrientationState extends State<CheckOrientation> {
  @override
  Widget build(BuildContext context) {
    return (getOSInsideWeb() != 'Web' &&
            MediaQuery.of(context).orientation == Orientation.portrait)
        ? Center(
            child: TextButton(
            onPressed: () async {
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
              setState(() {});
            },
            child: Text('Changez l\'orientation'),
          ))
        : widget.toDisplay;
  }
}
