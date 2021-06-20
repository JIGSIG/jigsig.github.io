// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'game_tiled_map.dart';
import 'package:flutter/material.dart';

class PlatformType {
  final bool isIos;
  final bool isAndroid;
  final bool isWeb;
  final bool init;

  PlatformType({
    this.init = false,
    this.isIos = false,
    this.isAndroid = false,
    this.isWeb = true,
  });
}

late final PlatformType? platformType;

void main() {
  runApp(DPMApp());
}

class DPMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Project Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameTiledMap(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/games/digital_project_manager.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

String getOSInsideWeb() {
  final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  try {
    platformType = new PlatformType(
      init: true,
      isIos: userAgent.contains("iphone") || userAgent.contains("ipad"),
      isAndroid: userAgent.contains("android"),
      isWeb: !userAgent.contains("iphone") &&
          !userAgent.contains("ipad") &&
          !userAgent.contains("android"),
    );
  } catch (err) {
    print(err.toString());
  }
  if (userAgent.contains("iphone")) return "Ios";
  if (userAgent.contains("ipad")) return "Ios";
  if (userAgent.contains("android")) return "Android";
  return "Web";
}
