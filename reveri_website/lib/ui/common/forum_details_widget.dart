import 'package:flutter/material.dart';
import 'package:reveri_website/ui/common/forum_card.dart';
import 'package:reveri_website/ui/common/label_value_widget.dart';
import 'package:reveri_website/ui/styleguide/text_styles.dart';

class MenuDetailsWidget extends StatelessWidget {
  final Game forum;

  MenuDetailsWidget({required this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: 155.0,
        padding: const EdgeInsets.only(
            left: 20.0, right: 16.0, top: 24.0, bottom: 12.0),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 2.0),
                    ),
                    height: 50.0,
                    width: 50.0,
                    child: Center(
                        child: Text(
                      forum.rank.toString(),
                      style: rankStyle,
                    )),
                  ),
                  Text("new", style: labelTextStyle),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LabelValueWidget(
                    value: forum.games.toString(),
                    label: "parties",
                    labelStyle: labelTextStyle,
                    valueStyle: valueTextStyle,
                  ),
                  LabelValueWidget(
                    value: forum.completed.toString(),
                    label: "réussites",
                    labelStyle: labelTextStyle,
                    valueStyle: valueTextStyle,
                  ),
                  LabelValueWidget(
                    value: forum.stars.toStringAsPrecision(2),
                    label: "étoiles",
                    labelStyle: labelTextStyle,
                    valueStyle: valueTextStyle,
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

class MyCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
        height - controlPointDistanceFromWall, 0 + distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 0 + 30.0);
    clippedPath.quadraticBezierTo(width - 5, 0 + 5.0, width - 35, 0 + 15.0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
