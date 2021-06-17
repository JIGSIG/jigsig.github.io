library reveri_games;
import 'dart:html';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:reveri_games/decoration/barrel_dragable.dart';
import 'package:reveri_games/decoration/chest.dart';
import 'package:reveri_games/decoration/spikes.dart';
import 'package:reveri_games/decoration/torch.dart';
import 'package:reveri_games/enemy/goblin.dart';
import 'package:reveri_games/interface/knight_interface.dart';
import 'package:reveri_games/manual_map/dungeon_map.dart';
import 'package:reveri_games/manual_map/game_manual_map.dart';
import 'package:reveri_games/player/knight.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'decoration/column.dart';

class GameTiledMap extends StatefulWidget {
  final int map;

  const GameTiledMap({Key? key, this.map = 1}) : super(key: key);

  @override
  _GameTiledMapState createState() => _GameTiledMapState();
}

class _GameTiledMapState extends State<GameTiledMap> {
  @override
  void initState() {
    if (getOSInsideWeb() == 'Ios')
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      document.documentElement!.requestFullscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return LayoutBuilder(
      builder: (context, constraints) {
        DungeonMap.tileSize = max(constraints.maxHeight, constraints.maxWidth) /
            (kIsWeb ? 20 : 22);
        return BonfireTiledWidget(
          joystick: Joystick(
            keyboardEnable: true,
            directional: JoystickDirectional(
              spriteBackgroundDirectional: Sprite.load(
                'joystick_background.png',
              ),
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
                spriteBackgroundDirection: Sprite.load(
                  'joystick_background.png',
                ),
                enableDirection: true,
                size: 50,
                margin: EdgeInsets.only(bottom: 50, right: 160),
              )
            ],
          ),
          player: Knight(
            Vector2((8 * DungeonMap.tileSize), (5 * DungeonMap.tileSize)),
          ),
          interface: KnightInterface(),
          map: TiledWorldMap(
            'tiled/mapa${widget.map}.json',
            forceTileSize: Size(DungeonMap.tileSize, DungeonMap.tileSize),
            objectsBuilder: {
              'goblin': (properties) => Goblin(properties.position),
              'torch': (properties) => Torch(properties.position),
              'barrel': (properties) => BarrelDraggable(properties.position),
              'spike': (properties) => Spikes(properties.position),
              'column': (properties) => ColumnDecoration(properties.position),
              'chest': (properties) => Chest(properties.position),
            },
          ),
          background: BackgroundColorGame(Colors.blueGrey[900]!),
          lightingColorGame: Colors.black.withOpacity(0.7),
        );
      },
    );
  }
}
