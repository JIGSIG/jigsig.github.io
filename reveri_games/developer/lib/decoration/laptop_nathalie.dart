import 'package:bonfire/bonfire.dart';
import 'package:developer/area/administrative_level_map.dart';
import 'package:developer/game_interface/Laptop_Nathalie.dart';
import 'package:developer/game_interface/laptop_screen.dart';
import 'package:developer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/common_sprite_sheet.dart';

class Computer2 extends GameDecoration {
  bool _observedPlayer = false;

  late TextPaint _textConfig;

  final List<String> choices = ['Hello Nathalie', 'Bye Nathalie'];
  String? choice;

  Computer2(Vector2 position)
      : super.withAnimation(
          CommonSpriteSheet.elevatorButtonAnimated,
          width: mapTileSize * 0.6,
          height: mapTileSize * 0.6,
          position: position,
        ) {
    _textConfig = TextPaint(
      config: TextPaintConfig(
        color: Colors.white,
        fontSize: width / 2,
      ),
    );
    hasInteraction(isInteractionObject: true);
  }

  @override
  void update(double dt) {
    this.seePlayer(
      observed: (player) {
        if (!_observedPlayer) {
          _observedPlayer = true;
          _showEmote();
        }
      },
      notObserved: () {
        _observedPlayer = false;
      },
      radiusVision: mapTileSize.toInt(),
    );
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observedPlayer) {
      _textConfig.render(
        canvas,
        '', //'''Touch me !!',
        Vector2(position.left - width / 1.5, position.center.dy - (height + 5)),
      );
    }
  }

  void _displayElevatorOptions() {
    print('showElevatorOptions');
    showDialog(
      barrierColor: Colors.transparent,
      context: gameRef.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          titlePadding: EdgeInsets.all(8.0),
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  child: choiceWidget(context),
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        );
      },
    ).then((value) => endInteraction(id: this));
  }

  void _showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emoteButtonA,
        target: this,
        positionFromTarget:
            Rect.fromLTWH(18, -5, mapTileSize, mapTileSize).toVector2Rect(),
      ),
    );
  }

  @override
  void onInteractionReceived() {
    print('onInteractionReceived');
    if (_observedPlayer) {
      _displayElevatorOptions();
    }
    super.onInteractionReceived();
  }

  Widget choiceWidget(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
        choices.length,
        (index) => ListTile(
          dense: true,
          title: Text(
            "${choices.elementAt(index)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          selectedTileColor: Colors.white,
          onTap: () {
            if (choices.elementAt(index) == "Hello Nathalie") {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Builder(
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: LaptopScreen2(context),
                      );
                    },
                  ),
                ),
              );
            } else {
              Navigator.of(context).pop();
            }
            // switch (choice) {
            //   case 'Lancez votre session':
            //     Navigator.of(context).pop();
            //     Navigator.pushReplacement<void, void>(
            //       context,
            //       MaterialPageRoute<void>(
            //         builder: (BuildContext context) => LapTopScreen(),
            //       ),
            //     );
            //     break;
            //   case 'Eteindre':
            //     Navigator.of(context).pop();
            //     break;
            // }
          },
        ),
      ),
    );
  }
}
