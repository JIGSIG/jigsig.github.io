import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final navLinks = [
    "Home",
    "Games",
    "About Us",
  ];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text,
            style: TextStyle(
              fontFamily: "Montserrat-Bold",
              color: Colors.white,
            )),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width > 800
          ? EdgeInsets.only(left: 150)
          : EdgeInsets.only(left: MediaQuery.of(context).padding.left / 2 + 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 125,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(191, 23, 11, 1),
                  Color.fromRGBO(191, 23, 11, .5),
                  Color.fromRGBO(16, 16, 17, 1),
                  Color.fromRGBO(16, 16, 17, 1),
                  Color.fromRGBO(16, 16, 17, 1),
                ], begin: Alignment.topLeft, end: Alignment.centerRight)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      text: 'R E V E R I ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
