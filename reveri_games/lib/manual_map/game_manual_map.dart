import 'dart:html';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/game_controller.dart';
import 'package:reveri_games/enemy/goblin.dart';
import 'package:reveri_games/interface/knight_interface.dart';
import 'package:reveri_games/manual_map/dungeon_map.dart';
import 'package:reveri_games/player/knight.dart';
import 'package:reveri_games/util/common_sprite_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return "Ios";
  if (userAgent.contains("ipad")) return "Ios";
  if (userAgent.contains("android")) return "Android";
  return "Web";
}

class GameManualMap extends StatelessWidget implements GameListener {
  final GameController _controller = GameController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return LayoutBuilder(builder: (context, constraints) {
      DungeonMap.tileSize =
          max(constraints.maxHeight, constraints.maxWidth) / (kIsWeb ? 20 : 22);
      return       Stack(
        children: [
          BonfireWidget(
            joystick: Joystick(
              keyboardEnable: true,
              directional: JoystickDirectional(
                spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
                spriteKnobDirectional: Sprite.load('joystick_knob.png'),
                size: 100,
                isFixed: false,
              ),
              actions: [
                JoystickAction(
                  actionId: PlayerAttackType.AttackMelee,
                  sprite: Sprite.load('joystick_atack.png'),
                  align: JoystickActionAlign.BOTTOM_RIGHT,
                  size: 80,
                  margin: EdgeInsets.only(bottom: 50, right: 50),
                ),
                JoystickAction(
                  actionId: PlayerAttackType.AttackRange,
                  sprite: Sprite.load('joystick_atack_range.png'),
                  spriteBackgroundDirection: Sprite.load('joystick_background.png'),
                  size: 50,
                  enableDirection: true,
                  margin: EdgeInsets.only(bottom: 50, right: 160),
                )
              ],
            ),
            player: Knight(
              Vector2((4 * DungeonMap.tileSize), (6 * DungeonMap.tileSize)),
            ),
            interface: KnightInterface(),
            map: DungeonMap.map(),
            enemies: DungeonMap.enemies(),
            decorations: DungeonMap.decorations(),
            background: BackgroundColorGame(Colors.blueGrey[900]!),
            components: [],
            gameController: _controller..setListener(this),
            lightingColorGame: Colors.black.withOpacity(0.75),
          ),
      if ((getOSInsideWeb() != 'Web' &&
      MediaQuery.of(context).orientation == Orientation.portrait))
        Center(
            child: TextButton(
              onPressed: () async {
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              },
              child: Text('Changez l\'orientation'),
            ))
        ],
      );
    });
  }

  @override
  void updateGame() {}

  @override
  void changeCountLiveEnemies(int count) {
    if (count < 2) {
      _addEnemyInWorld();
    }
  }

  void _addEnemyInWorld() {
    double x = DungeonMap.tileSize * (4 + Random().nextInt(25));
    double y = DungeonMap.tileSize * (5 + Random().nextInt(3));

    final goblin = Goblin(Vector2(x, y));

    _controller.addGameComponent(AnimatedObjectOnce(
      animation: CommonSpriteSheet.smokeExplosion,
      position: goblin.position,
    ));

    _controller.addGameComponent(
      goblin,
    );
  }
}
