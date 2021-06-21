// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:reveri_website/ui/landing_page.dart';

class PlatformType {
  final bool isIos;
  final bool isAndroid;
  final bool isWeb;
  final bool init;

  PlatformType({
    this.init = false,
    this.isIos = false,
    this.isAndroid = false,
    this.isWeb = false,
  });
}

late final PlatformType? platformType;

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

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFFFFFFF, color);

void main() {
  getOSInsideWeb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      title: 'Reveri Games',
      home: LandingPage(),
    );
  }
}
