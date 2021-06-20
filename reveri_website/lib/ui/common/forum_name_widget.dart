import 'package:flutter/material.dart';
import 'package:reveri_website/ui/common/forum_card.dart';
import 'package:reveri_website/ui/styleguide/colors.dart';
import 'package:reveri_website/ui/styleguide/text_styles.dart';

class MenuNameWidget extends StatelessWidget {
  final Game forum;

  MenuNameWidget({required this.forum});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: primaryColor,
          elevation: 20.0,
          shape: CustomShapeBorder(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
          ),
          child: Container(
            width: 100,
            height: 50,
            child: Center(
              child: Text(
                forum.title,
                overflow: TextOverflow.clip,
                style: forumNameTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomShapeBorder extends ShapeBorder {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  Path getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.moveTo(0 + distanceFromWall, 0);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
        0 + controlPointDistanceFromWall, 0, 0 + distanceFromWall);
    clippedPath.lineTo(0, size.height - distanceFromWall);
    clippedPath.quadraticBezierTo(
        0 + controlPointDistanceFromWall,
        size.height - controlPointDistanceFromWall,
        0 + distanceFromWall,
        size.height);
    clippedPath.lineTo(size.width - distanceFromWall, size.height);
    clippedPath.quadraticBezierTo(
        size.width - controlPointDistanceFromWall,
        size.height - controlPointDistanceFromWall,
        size.width,
        size.height - distanceFromWall);
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(
        size.width - 1,
        size.height * 0.6 - distanceFromWall,
        size.width - distanceFromWall,
        size.height * 0.6 - distanceFromWall - 3);
    clippedPath.lineTo(0 + distanceFromWall + 6, 0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(Size(130.0, 60.0));
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
