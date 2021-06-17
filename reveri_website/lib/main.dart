import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reveri_website/ui/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reveri Games',
      home: MenuPage(),
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