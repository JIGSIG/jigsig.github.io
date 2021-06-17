import 'package:flutter/material.dart';
import '../Responsive/landing_page.dart';

class NavBar extends StatelessWidget {
  // Navigation Bar Items
  final navLinks = ["Food", "Shelter", "Toy", "Pets"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold")),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 16, 17, 1),
      padding: EdgeInsets.only(left: 190, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 16,
                // child: Text("ttest"),
              ),
              Text("ReverieGames", style: TextStyle(fontSize: 26, color: Colors.white,))
            ],
          ),
          // Responsive Layout
        ],
      ),
    );
  }
}