import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:developer/main.dart';
import 'package:developer/npc/admin-employees/ThomasAndre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/spring.dart';

class QuestPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quest1();
  }
}

class Quest1 extends State<QuestPage1> {
  CarouselController buttonCarouselController = CarouselController();
  int _Writingspeed = 50;
  @override
  void initState() {
    super.initState();
    _Writingspeed = 50;
  }

  int _update() {
    setState(() {
      _Writingspeed = _Writingspeed - 300;
    });
    return _Writingspeed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              carouselController: buttonCarouselController,
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: new BoxDecoration(
                    color: Colors.black,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.6,
                      ),
                      DefaultTextStyle(
                        style: GoogleFonts.ubuntu(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize:
                              MediaQuery.of(context).size.width > 850 ? 20 : 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: AnimatedTextKit(
                            totalRepeatCount: 1,
                            onFinished: () {
                              Timer(Duration(milliseconds: 50), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DevApp()),
                                );
                              });
                            },
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Quête 1 : Rendez-vous au Bureau de Thomas André.',
                                speed: Duration(milliseconds: _Writingspeed),
                              ),
                            ],
                            onTap: () {},
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width > 850
                              ? MediaQuery.of(context).size.height
                              : MediaQuery.of(context).size.height / 1.5,
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Spring.bubbleButton(
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           buttonCarouselController.nextPage(
                      //               duration: Duration(milliseconds: 300),
                      //               curve: Curves.linear);
                      //         });
                      //       },
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width > 850
                      //             ? MediaQuery.of(context).size.width / 15
                      //             : 70,
                      //         height: MediaQuery.of(context).size.width > 850
                      //             ? MediaQuery.of(context).size.height / 10
                      //             : 70,
                      //         child: Card(
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //           ),
                      //           color: Colors.pink,
                      //           elevation: 10,
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: <Widget>[
                      //               IconButton(
                      //                 onPressed: () {
                      //                   // buttonCarouselController.nextPage(
                      //                   //     duration:
                      //                   //         Duration(milliseconds: 500),
                      //                   //     curve: Curves.linear);
                      //                   Timer(Duration(milliseconds: 100), () {
                      //                     Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                           builder: (context) => DevApp()),
                      //                     );
                      //                   });
                      //                 },
                      //                 icon: Icon(Icons.arrow_right_rounded),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height,
                //   decoration: new BoxDecoration(
                //     color: Colors.blueAccent,
                //     borderRadius: new BorderRadius.only(
                //       topLeft: const Radius.circular(20.0),
                //       topRight: const Radius.circular(20.0),
                //       bottomLeft: const Radius.circular(20.0),
                //       bottomRight: const Radius.circular(20.0),
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height / 15,
                //       ),
                //       DefaultTextStyle(
                //         style: GoogleFonts.ubuntu(
                //           textStyle: Theme.of(context).textTheme.headline4,
                //           fontSize:
                //               MediaQuery.of(context).size.width > 850 ? 20 : 15,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.italic,
                //           color: Colors.black,
                //         ),
                //         child: AnimatedTextKit(
                //           totalRepeatCount: 1,
                //           animatedTexts: [
                //             TypewriterAnimatedText(
                //               'Quête 1 : Rendez-vous au ...',
                //               speed: Duration(milliseconds: _Writingspeed),
                //             ),
                //           ],
                //           onTap: () {},
                //         ),
                //       ),
                //       Flexible(
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.width > 850
                //               ? MediaQuery.of(context).size.height
                //               : MediaQuery.of(context).size.height / 1.5,
                //         ),
                //       ),
                //       Align(
                //         alignment: Alignment.bottomRight,
                //         child: Spring.bubbleButton(
                //           child: GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 buttonCarouselController.nextPage(
                //                     duration: Duration(milliseconds: 300),
                //                     curve: Curves.linear);
                //               });
                //             },
                //             child: Container(
                //               width: MediaQuery.of(context).size.width > 850
                //                   ? MediaQuery.of(context).size.width / 15
                //                   : 70,
                //               height: MediaQuery.of(context).size.width > 850
                //                   ? MediaQuery.of(context).size.height / 10
                //                   : 70,
                //               child: Card(
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15.0),
                //                 ),
                //                 color: Colors.pink,
                //                 elevation: 10,
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: <Widget>[
                //                     IconButton(
                //                       onPressed: () {
                //                         buttonCarouselController.nextPage(
                //                             duration:
                //                                 Duration(milliseconds: 500),
                //                             curve: Curves.linear);
                //                       },
                //                       icon: Icon(Icons.arrow_right_rounded),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //  ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height,
                //   decoration: new BoxDecoration(
                //     color: Colors.blueAccent,
                //     borderRadius: new BorderRadius.only(
                //       topLeft: const Radius.circular(20.0),
                //       topRight: const Radius.circular(20.0),
                //       bottomLeft: const Radius.circular(20.0),
                //       bottomRight: const Radius.circular(20.0),
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height / 15,
                //       ),
                //       DefaultTextStyle(
                //         style: GoogleFonts.ubuntu(
                //           textStyle: Theme.of(context).textTheme.headline4,
                //           fontSize:
                //               MediaQuery.of(context).size.width > 850 ? 20 : 15,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.italic,
                //           color: Colors.black,
                //         ),
                //         child: AnimatedTextKit(
                //           totalRepeatCount: 1,
                //           animatedTexts: [
                //             TypewriterAnimatedText(
                //               'Quête 1 : Rendez-vous au ...',
                //               speed: Duration(milliseconds: _Writingspeed),
                //             ),
                //           ],
                //           onTap: () {},
                //         ),
                //       ),
                //       Flexible(
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.width > 850
                //               ? MediaQuery.of(context).size.height
                //               : MediaQuery.of(context).size.height / 1.5,
                //         ),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Align(
                //             alignment: Alignment.bottomRight,
                //             child: Spring.bubbleButton(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     buttonCarouselController.nextPage(
                //                         duration: Duration(milliseconds: 300),
                //                         curve: Curves.linear);
                //                   });
                //                 },
                //                 child: Container(
                //                   width: MediaQuery.of(context).size.width > 850
                //                       ? MediaQuery.of(context).size.width / 15
                //                       : 70,
                //                   height: MediaQuery.of(context).size.width >
                //                           850
                //                       ? MediaQuery.of(context).size.height / 10
                //                       : 70,
                //                   child: Card(
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(15.0),
                //                     ),
                //                     color: Colors.pink,
                //                     elevation: 10,
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.center,
                //                       children: <Widget>[
                //                         IconButton(
                //                           onPressed: () {
                //                             buttonCarouselController.nextPage(
                //                                 duration:
                //                                     Duration(milliseconds: 500),
                //                                 curve: Curves.linear);
                //                           },
                //                           icon: Icon(Icons.arrow_right_rounded),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Align(
                //             alignment: Alignment.bottomLeft,
                //             child: Spring.bubbleButton(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     buttonCarouselController.nextPage(
                //                         duration: Duration(milliseconds: 300),
                //                         curve: Curves.linear);
                //                   });
                //                 },
                //                 child: Container(
                //                   width: MediaQuery.of(context).size.width > 850
                //                       ? MediaQuery.of(context).size.width / 15
                //                       : 70,
                //                   height: MediaQuery.of(context).size.width >
                //                           850
                //                       ? MediaQuery.of(context).size.height / 10
                //                       : 70,
                //                   child: Card(
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(15.0),
                //                     ),
                //                     color: Colors.pink,
                //                     elevation: 10,
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.center,
                //                       children: <Widget>[
                //                         IconButton(
                //                           onPressed: () {
                //                             Navigator.push<void>(
                //                               context,
                //                               MaterialPageRoute<void>(
                //                                 builder:
                //                                     (BuildContext context) =>
                //                                         DevApp(),
                //                               ),
                //                             );
                //                           },
                //                           icon: Icon(Icons.arrow_right_rounded),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: i,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.1,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget questWidget(BuildContext context, int questnumber) {
  return Container(
    child: Align(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: GoogleFonts.ubuntu(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TypewriterAnimatedText(
              'Quête' '$questnumber' ': Rendez-vous au ...',
              speed: const Duration(milliseconds: 30),
            ),
          ],
          onTap: () {},
        ),
      ),
    ),
  );
}
