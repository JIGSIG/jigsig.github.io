import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reveri_website/ui/landingTools/navbar.dart';
import 'package:reveri_website/ui/menu_page.dart';
import 'package:reveri_website/ui/landing_page.dart';

import 'package:reveri_website/ui/Responsive/landing_page.dart';
import './ui/Responsive/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reveri Games',
      home: LandingPage(),
    );
  }
}


String getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return "Ios";
  if (userAgent.contains("ipad")) return "Ios";
  if (userAgent.contains("android")) return "Android";
  return "Web";
}