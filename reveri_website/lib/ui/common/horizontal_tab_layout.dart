// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:digital_project_manager/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reveri_website/ui/common/label_value_widget.dart';
import 'package:reveri_website/ui/styleguide/text_styles.dart';

import 'forum_card.dart';

class HorizontalTabLayout extends StatefulWidget {
  final TextEditingController searchController;

  const HorizontalTabLayout({Key? key, required this.searchController})
      : super(key: key);

  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _fadeAnimation;
  List<Game> gameToDisplay = games;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Offset>(begin: Offset(0.05, 0), end: Offset(0, 0))
        .animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    widget.searchController.addListener(() {
      setState(() {
        gameToDisplay = games
            .where(
              (element) => element.title
                  .toString()
                  .toLowerCase()
                  .contains(widget.searchController.text.toLowerCase()),
            )
            .toList();
      });
    });
  }

  playAnimation() {
    //_controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: platformType!.isWeb ? _bodyPc() : _bodyMobile(),
    );
  }

  _bodyPc() {
    final Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 6;

    return Padding(
      padding: const EdgeInsets.only(left: 125.0, top: 68),
      child: FutureBuilder(
        future: playAnimation(),
        builder: (context, snapshot) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _animation,
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 5,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                children: List.generate(
                  gameToDisplay.length,
                  (index) => MenuCard(
                    game: gameToDisplay.elementAt(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _bodyMobile() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 68,
          ),
          Container(
            height: size.height - 68,
            child: ListView.builder(
                itemCount: gameToDisplay.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        SystemChrome.setEnabledSystemUIOverlays([]);
                        if (!platformType!.isIos)
                          document.documentElement!.requestFullscreen();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  gameToDisplay.elementAt(index).game),
                        );
                      },
                      child: Container(
                        height: 90,
                        width: size.width - 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ListTile(
                              leading: Container(
                                width: size.width * .2 - 24,
                              ),
                              title: SizedBox(
                                height: 35,
                                child: Text(
                                  gameToDisplay.elementAt(index).title,
                                  style: forumNameTextStyle,
                                ),
                              ),
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  LabelValueWidget(
                                    value: gameToDisplay
                                        .elementAt(index)
                                        .games
                                        .toString(),
                                    label: "parties",
                                    labelStyle: labelTextStyle,
                                    valueStyle: valueTextStyle,
                                  ),
                                  LabelValueWidget(
                                    value: gameToDisplay
                                        .elementAt(index)
                                        .completed
                                        .toString(),
                                    label: "réussites",
                                    labelStyle: labelTextStyle,
                                    valueStyle: valueTextStyle,
                                  ),
                                  LabelValueWidget(
                                    value: gameToDisplay
                                        .elementAt(index)
                                        .stars
                                        .toStringAsPrecision(2),
                                    label: "étoiles",
                                    labelStyle: labelTextStyle,
                                    valueStyle: valueTextStyle,
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 30,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: 90,
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.01),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    gameToDisplay.elementAt(index).imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
