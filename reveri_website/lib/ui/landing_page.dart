import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reveri_website/ui/Responsive/landing_page.dart';
import 'package:reveri_website/ui/landingTools/navbar.dart';
import 'package:reveri_website/ui/menu_page.dart';

import '../ui/Responsive/landing_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.black, Colors.grey],
      //     begin: const FractionalOffset(0.0, 0.0),
      //     end: const FractionalOffset(1.0, 0.0),
      //     stops: [0.0, 1.0],
      //     tileMode: TileMode.clamp,
      //   ),
      // ),
      color: Color.fromRGBO(16, 16, 17, 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              NavBar(),
              Body(),
//              if (MediaQuery.of(context).size.width < 800) SmallChildpart1(),
//              if (MediaQuery.of(context).size.width < 800) SmallChildpart2(),
//              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Large(),
      smallScreen: SmallChild(),
      mediumScreen: SmallChild(),
    );
  }
}

class Large extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                    EdgeInsets.only(right: 90, bottom: 80),
                                    child: Column(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: new Text(
                                            "Follow Us" + "    " + "|",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily:
                                                "Montserrat-Regular",
                                                color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: new Icon(
                                            Icons.facebook,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: new Icon(
                                            Icons.biotech_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: new Icon(
                                            Icons.disc_full_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height - 190,
                            child: Image.asset(
                              "assets/images/control_body.png",
                              height: 800,
                              width: 800,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2 - 200,
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.only(right: 170, bottom: 50),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Gaming\nCommunity",
                                        style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat-Regular",
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.red,
                                              offset: Offset(1.5, -1.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "Montserrat-Regular",
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "Montserrat-Regular",
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 90,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: 200, height: 50),
                                        child: ElevatedButton(
                                            child: Text(
                                                "Jouer maintenant"
                                                    .toUpperCase(),
                                                style: TextStyle(fontSize: 15)),
                                            style: ButtonStyle(
                                              foregroundColor:
                                              MaterialStateProperty.all<
                                                  Color>(Colors.white),
                                              backgroundColor:
                                              MaterialStateProperty.all<
                                                  Color>(Colors.red),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(35),
                                                  side: BorderSide(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MenuPage()),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    color: Color.fromRGBO(12, 12, 12, 1),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 120),
                    child: SizedBox(
                      child: Row(children: [
                        Column(
                          children: [
                            Text(
                              "Today's",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat-Regular",
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 40),
                            Text(
                              "Games Collection",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat-Regular",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 40),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat-Regular",
                                  color: Colors.white),
                            ),
                            Text(
                              "elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat-Regular",
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 200, height: 50),
                              child: ElevatedButton(
                                  child: Text("Browse more".toUpperCase(),
                                      style: TextStyle(fontSize: 15)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(35),
                                              side:
                                              BorderSide(color: Colors.red)))),
                                  onPressed: () => null),
                            ),
                          ],
                        ),
                        Container(
                          color: Color.fromRGBO(12, 12, 12, 1),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height - 190,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          padding: EdgeInsets.only(left: 90),
                          child: CarouselSlider(
                            items: [
                              "assets/images/control.jpg",
                              "assets/images/back_control.jpg",
                              "assets/images/jesse.jpg"
                            ].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          '$i',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 400,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.4,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 1.15,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                                color: Color.fromRGBO(16, 16, 17, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Jam Games',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: '.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                            4 +
                                            50,
                                        height:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .height /
                                            2 +
                                            100,
                                        color: Color.fromRGBO(23, 24, 24, 1.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          padding: EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                                color: Color.fromRGBO(16, 16, 17, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Best Sales',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: '.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                            4 +
                                            50,
                                        height:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .height /
                                            2 +
                                            100,
                                        color: Color.fromRGBO(23, 24, 24, 1.0),
                                        child: Column(
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                                color: Color.fromRGBO(16, 16, 17, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Reveri Games',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: '.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                            4 +
                                            80,
                                        height:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .height /
                                            2 +
                                            100,
                                        color: Color.fromRGBO(23, 24, 24, 1.0),
                                        child: Column(
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: FractionallySizedBox(
                            alignment: Alignment.center,
                            widthFactor: 1.4,
                            child: Image.asset(
                              'assets/images/geralt.jpg',
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 1.20,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 80, left: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'R E V E R I ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 55,
                                          color: Colors.white),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '.\n\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 85,
                                                color: Colors.blue)),
                                        TextSpan(
                                          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt \nut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\ncommodo consequat.\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                                          , style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 20,
                                            color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.facebook,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.facebook,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: 200, height: 50),
                                  child: ElevatedButton(
                                      child: Text("Browse more".toUpperCase(),
                                          style: TextStyle(fontSize: 15)),
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(35),
                                                  side:
                                                  BorderSide(
                                                      color: Colors.blue)))),
                                      onPressed: () => null),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 16, 17, 1),
      height: MediaQuery
          .of(context)
          .size
          .height - 150,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.04,
            heightFactor: 0.5,
            child: Container(
              child: Column(
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: new Text(
                      "Follow Us" + "    " + "|",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Montserrat-Regular",
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RotatedBox(
                      quarterTurns: 1,
                      child: new Icon(
                        Icons.facebook,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  RotatedBox(
                      quarterTurns: 1,
                      child: new Icon(
                        Icons.biotech_rounded,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  RotatedBox(
                      quarterTurns: 1,
                      child: new Icon(
                        Icons.disc_full_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: .6,
            heightFactor: 1.3,
            child: Image.asset(
              "assets/images/control_body.png",
              height: 800,
              width: 800,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Gaming\nCommunity",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat-Regular",
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.red,
                          offset: Offset(1.5, -1.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.white),
                  ),
                  Text(
                    "elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 200, height: 50),
                    child: ElevatedButton(
                        child: Text("Jouer maintenant".toUpperCase(),
                            style: TextStyle(fontSize: 15)),
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MenuPage()),
                          );
                        }),
                  ),
                  Container(
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LargeChildpart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(12, 12, 12, 1),
      height: MediaQuery
          .of(context)
          .size
          .height - 150,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 190),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Today's",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Games Collection",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Montserrat-Regular",
                          color: Colors.white),
                    ),
                    Text(
                      "elit, sed do eiusmod tempor incididunt ut labore et doloret.",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Montserrat-Regular",
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ConstrainedBox(
                      constraints:
                      BoxConstraints.tightFor(width: 200, height: 50),
                      child: ElevatedButton(
                          child: Text("Browse more".toUpperCase(),
                              style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () => null),
                    ),
                  ]),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 190, right: 190),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CarouselSlider(
                      items: [
                        "assets/images/control.jpg",
                        "assets/images/back_control.jpg",
                        "assets/images/jesse.jpg"
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    '$i',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.4,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class LargeChildpart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(12, 12, 12, 1),
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .4,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Container(
                  color: Color.fromRGBO(16, 16, 17, 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: 100, top: 40),
                    child: Column(
                      children: [
                        Text(
                          "Community Games",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat-Regular",
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4 + 50,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2 + 100,
                          color: Color.fromRGBO(23, 24, 24, 1.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Image.asset(
                                        "images/jesse.png",
                                        width: 100,
                                        height: 50,
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Spinach soup",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 16),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Fresh spinach, mushrooms, and hard-boiled egg served with warm bacon vinaigrette",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "15.4" + " Calories",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: .4,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Container(
                  color: Color.fromRGBO(16, 16, 17, 1),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text(
                          "Best Sales",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat-Regular",
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4 + 50,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2 + 100,
                          color: Color.fromRGBO(23, 24, 24, 1.0),
                          child: Column(
                            children: [],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .3,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Container(
                  color: Color.fromRGBO(16, 16, 17, 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: 40, top: 40),
                    child: Column(
                      children: [
                        Text(
                          "Reveri Games",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat-Regular",
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4 + 80,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2 + 100,
                          color: Color.fromRGBO(23, 24, 24, 1.0),
                          child: Column(
                            children: [],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: FractionallySizedBox(
          alignment: Alignment.center,
          widthFactor: 0.85,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height / 20),
                            Text(
                              "Games Community",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat-Regular",
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.red,
                                    offset: Offset(1.5, -1.5),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat-Regular",
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            FractionallySizedBox(
                              alignment: Alignment.center,
                              widthFactor: 1.0,
                              child: Image.asset(
                                "assets/images/control.png",
                              ),
                            ),
                            SizedBox(
                              height: 55,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 200, height: 50),
                              child: ElevatedButton(
                                  child: Text("Jouer maintenant".toUpperCase(),
                                      style: TextStyle(fontSize: 15)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(35),
                                              side:
                                              BorderSide(color: Colors.red)))),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MenuPage()),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  color: Color.fromRGBO(16, 16, 17, 1),
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.center,
                        widthFactor: 0.98,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Text(
                                      "Today's",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat-Regular",
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Games Collection",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat-Regular",
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Montserrat-Regular",
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: 200, height: 50),
                                      child: ElevatedButton(
                                          child: Text(
                                              "Browse more".toUpperCase(),
                                              style: TextStyle(fontSize: 15)),
                                          style: ButtonStyle(
                                              foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(35),
                                                      side: BorderSide(
                                                          color: Colors.red)))),
                                          onPressed: () => null),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              CarouselSlider(
                                items: [
                                  "assets/images/control.jpg",
                                  "assets/images/back_control.jpg",
                                  "assets/images/jesse.jpg"
                                ].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        child: SizedBox(
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Image.asset(
                                              '$i',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 350,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1.1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.98,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Container(
                              color: Color.fromRGBO(16, 16, 17, 1),
                              child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Community Games",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat-Regular",
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width -
                                          10,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height /
                                          2 -
                                          20,
                                      color: Color.fromRGBO(23, 24, 24, 1.0),
                                      child: Column(
                                        children: [],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.98,
                        child: Padding(
                            padding: EdgeInsets.zero,
                            child: SingleChildScrollView(
                              child: Container(
                                  color: Color.fromRGBO(16, 16, 17, 1),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Best Sales",
                                            style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat-Regular",
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width -
                                              10,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height /
                                              2 -
                                              20,
                                          color:
                                          Color.fromRGBO(23, 24, 24, 1.0),
                                          child: Column(
                                            children: [],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            )),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.98,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Container(
                              color: Color.fromRGBO(16, 16, 17, 1),
                              child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Reveri Games",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat-Regular",
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width -
                                          10,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height /
                                          2 -
                                          20,
                                      color: Color.fromRGBO(23, 24, 24, 1.0),
                                      child: Column(
                                        children: [],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: 1.4,
                          child: Image.asset(
                            'assets/images/esport.jpg',
                            height: 250,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 80, left: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'Get Latest news in your inbox from Gamix Gaming Community',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 200, height: 50),
                                child: ElevatedButton(
                                    child: Text("Browse more".toUpperCase(),
                                        style: TextStyle(fontSize: 15)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(35),
                                                side:
                                                BorderSide(
                                                    color: Colors.grey)))),
                                    onPressed: () => null),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FractionallySizedBox(
                  widthFactor: 1.15,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                        color: Color.fromRGBO(16, 16, 17, 1),
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                              SizedBox(height: 20),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Montserrat-Regular",
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
