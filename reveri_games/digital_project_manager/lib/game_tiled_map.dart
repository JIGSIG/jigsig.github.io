import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:digital_project_manager/npc/back_end_dev.dart';
import 'package:digital_project_manager/npc/designer.dart';
import 'package:digital_project_manager/npc/front_end_dev.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'interface/knight_interface.dart';
import 'main.dart';
import 'npc/client.dart';
import 'player/joueur.dart';

class GameTiledMap extends StatefulWidget {
  final int map;
  final PlatformType platformType;

  const GameTiledMap({
    Key? key,
    this.map = 1,
    required this.platformType,
  }) : super(key: key);

  @override
  _GameTiledMapState createState() => _GameTiledMapState();
}

class _GameTiledMapState extends State<GameTiledMap> {
  @override
  void initState() {
    if (!kIsWeb) {
      Flame.device.setLandscape();
      Flame.device.fullScreen();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return LayoutBuilder(
      builder: (context, constraints) {
        mapTileSize = max(constraints.maxHeight, constraints.maxWidth) /
            (kIsWeb ? 35 : 22);
        return Stack(
          children: [
            BonfireTiledWidget(
              joystick: Joystick(
                keyboardEnable: true,
                directional: JoystickDirectional(
                  spriteBackgroundDirectional: Sprite.load(
                    'joystick_background.png',
                  ),
                  spriteKnobDirectional: Sprite.load('joystick_knob.png'),
                  size: 100,
                  isFixed: true,
                ),
                actions: [
                  JoystickAction(
                    actionId: PlayerActionType.Interaction,
                    sprite: Sprite.load('joystick_atack.png'),
                    align: JoystickActionAlign.BOTTOM_RIGHT,
                    size: 100,
                    margin: EdgeInsets.only(bottom: 50, right: 50),
                  ),
                ],
              ),
              player: Joueur(Vector2((5 * mapTileSize), (12 * mapTileSize))),
              interface: JoueurInterface(),
              map: TiledWorldMap(
                'maps/office.json',
                forceTileSize: Size(mapTileSize, mapTileSize),
                objectsBuilder: {
                  'client': (properties) => ClientNPC(
                        properties.position,
                        dialogFilename: 'client.json',
                      ),
                  'Designer': (properties) => DesignerNPC(
                        properties.position,
                        dialogFilename: 'client.json',
                      ),
                  'BackDev': (properties) => BackEndDevNPC(
                        properties.position,
                        dialogFilename: 'client.json',
                      ),
                  'FrontDev': (properties) => FrontEndDevNPC(
                        properties.position,
                        dialogFilename: 'client.json',
                      ),
                },
              ),
              background: BackgroundColorGame(Colors.black),
              lightingColorGame: Colors.black.withOpacity(0.1),
            ),
            if (MediaQuery.of(context).orientation == Orientation.portrait)
              Opacity(
                opacity: .75,
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(16, 16, 17, 1),
                  body: Center(
                      child: TextButton(
                    onPressed: () async {
                      await SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ]);
                    },
                    child: Text(
                      'Changez l\'orientation'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
                ),
              ),
          ],
        );
      },
    );
  }
}
