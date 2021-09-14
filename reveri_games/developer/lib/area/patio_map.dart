import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:developer/Quests/Quest1.dart';
import 'package:developer/decoration/elevatorButton.dart';
import 'package:developer/interface/joueur_quest_interface.dart';
import 'package:developer/npc/patio_employees/employee1.dart';
import 'package:developer/npc/patio_employees/employee2.dart';
import 'package:developer/npc/patio_employees/etienne.dart';
import 'package:developer/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../player/joueur.dart';

class PatioMap extends StatefulWidget {
  final int map;
  final PlatformType platformType;

  const PatioMap({
    Key? key,
    this.map = 1,
    required this.platformType,
  }) : super(key: key);

  @override
  _PatioMapState createState() => _PatioMapState();
}

class _PatioMapState extends State<PatioMap> {
  late final Vector2 playerSpawn;
  bool loading = true;
  bool quest1 = false;
  final String map = "maps/patio/patio.json";

  @override
  void initState() {
    checkQuestAvailable();
    findPlayerLocation(map: "assets/images/$map", context: context)
        .then((value) {
      playerSpawn = value;
      loading = false;
      setState(() {});
    });
    if (!kIsWeb) {
      Flame.device.setLandscape();
      Flame.device.fullScreen();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    if (loading == false)
      return LayoutBuilder(
        builder: (context, constraints) {
          mapTileSize = max(constraints.maxHeight, constraints.maxWidth) / 22;
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
                      sprite: Sprite.load('A1.png'),
                      align: JoystickActionAlign.BOTTOM_RIGHT,
                      size: 70,
                      margin: EdgeInsets.only(bottom: 60, right: 100),
                    ),
                  ],
                ),
                player: Joueur(playerSpawn),
                interface: JoueurQuestInterface(),
                map: TiledWorldMap(
                  map,
                  forceTileSize: Size(mapTileSize, mapTileSize),
                  objectsBuilder: {
                    'elevatorButton': (properties) => ElevatorButton(
                          properties.position,
                        ),
                    'chef2': (properties) => PatioEmployee2NPC(
                          properties.position,
                          dialogFilename: 'chef2.json',
                        ),
                    'chef1': (properties) => PatioEmployee1NPC(
                          properties.position,
                          dialogFilename: 'chef1.json',
                        ),
                    'etienne': (properties) => PatioEmployee3NPC(
                          properties.position,
                          dialogFilename:
                              "Patio/Etienne(Quête-4)-Leader-d'équipe.json",
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
              if (quest1 == true) questWidget(context, 1),
            ],
          );
        },
      );
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkQuestAvailable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('_quest1_available') == true) {
      setState(() {
        quest1 = true;
      });
    }
  }
}
