import 'package:flutter/material.dart';
import '../Responsive/landing_page.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Home", "Games", "About Us",];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold", color: Colors.white,)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: 150) :  EdgeInsets.only(left: MediaQuery.of(context).padding.left / 2 + 50),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(16, 16, 17, 1),
                       Color.fromRGBO(191, 23, 11, 1),
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
              ),
              SizedBox(
                width: 16,
              ),
              Text("Reverie", style: TextStyle(fontSize: 26, color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
