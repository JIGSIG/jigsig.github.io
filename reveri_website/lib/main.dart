import 'package:flutter/material.dart';
import 'package:reveri_website/ui/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reveri Games',
      home: LandingPage(),
    );
  }
}
