import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reveri_website/ui/Responsive/landing_page.dart';
import 'package:reveri_website/ui/landingTools/navbar.dart';
import '../ui/Responsive/landing_page.dart';
import '../ui/landingTools/footer.dart';

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
              if (MediaQuery.of(context).size.width > 800) LargeChildpart1(),
              if (MediaQuery.of(context).size.width < 800) SmallChildpart1(),
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
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
      mediumScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 16, 17, 1),
      height: MediaQuery.of(context).size.height - 150,
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
            child: Image.network(
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
                          child: Text("JOIN COMMUNITY".toUpperCase(),
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
      height: MediaQuery.of(context).size.height - 150,
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
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
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

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.65,
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
                          SizedBox(height: MediaQuery.of(context).size.height / 20),
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
                          SizedBox(height: 11,),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular",
                                color: Colors.white),
                          ),
                          FractionallySizedBox(
                            alignment: Alignment.center,
                            widthFactor: 1.0,
                            child: Image.network(
                                "assets/images/control.png",),
                          ),
                          SizedBox(height: 15,),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
                            child: ElevatedButton(
                                child: Text("Join Community".toUpperCase(),
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
                                            side: BorderSide(
                                                color: Colors.red)))),
                                onPressed: () => null),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallChildpart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(12, 12, 12, 1),
      height: MediaQuery.of(context).size.height + 100,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.65,
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
                            constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
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
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
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
