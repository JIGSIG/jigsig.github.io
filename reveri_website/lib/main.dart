import 'package:flutter/material.dart';
import 'package:reveri_website/ui/landing_page.dart';
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
