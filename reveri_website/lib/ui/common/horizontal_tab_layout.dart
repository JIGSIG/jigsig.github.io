import 'package:flutter/material.dart';
import 'package:reveri_website/main.dart';

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
  int selectedTabIndex = 2;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _fadeAnimation;
  List<Game> gameToDisplay = games;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
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
      height: getOSInsideWeb() == 'Web' ? MediaQuery.of(context).size.height
          - kToolbarHeight - 40 : 400,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _animation,
                    child:
                        getOSInsideWeb() == 'Web' ? _bodyPc() : _bodyMobile(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _bodyPc() {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 6;

    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 5,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: List.generate(
        gameToDisplay.length,
        (index) => MenuCard(
          forum: gameToDisplay.elementAt(index),
        ),
      ),
    );
  }

  _bodyMobile() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: FutureBuilder(
        future: playAnimation(),
        builder: (context, snapshot) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _animation,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  gameToDisplay.length,
                  (index) => MenuCard(
                    forum: gameToDisplay.elementAt(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
