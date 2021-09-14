import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:developer/Quests/Quest1.dart';
import 'package:developer/decoration/elevatorButton.dart';
import 'package:developer/decoration/laptop.dart';
import 'package:developer/interface/joueur_quest_interface.dart';
import 'package:developer/npc/back_end_dev.dart';
import 'package:developer/npc/designer.dart';
import 'package:developer/npc/dev-employees/dev-employee2.dart';
import 'package:developer/npc/dev-employees/dev-employee3.dart';
import 'package:developer/npc/dev-employees/dev-employee4.dart';
import 'package:developer/npc/dev-employees/dev-employee6.dart';
import 'package:developer/npc/front_end_dev.dart';
import 'package:developer/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../player/joueur.dart';

class OfficeMap extends StatefulWidget {
  final int map;
  final PlatformType platformType;

  const OfficeMap({
    Key? key,
    this.map = 1,
    required this.platformType,
  }) : super(key: key);

  @override
  _OfficeMapState createState() => _OfficeMapState();
}

class _OfficeMapState extends State<OfficeMap> {
  late final Vector2 playerSpawn;
  bool loading = true;
  bool quest1 = false;
  final String map = "maps/office/office.json";

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
                    'computer': (properties) => Computer(
                          properties.position,
                        ),
                    'BackDev': (properties) => BackEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'FrontDev': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'npc1': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'npc2': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'npc3': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'npc4': (properties) => DesignerNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'npc5': (properties) => DesignerNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'sebastian': (properties) => DevEmployee4NPC(
                          properties.position,
                          dialogFilename: 'DEV_floor/Sebastian-Technicien.json',
                        ),
                    'npc7': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'ezequiel': (properties) => DevEmployee1NPC(
                          properties.position,
                          dialogFilename: 'DEV_floor/Ezequiel Kpavo-DEV.json',
                        ),
                    'npc9': (properties) => FrontEndDevNPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                    'magi': (properties) => DevEmploye2NPC(
                          properties.position,
                          dialogFilename: 'DEV_floor/Magi-DEV.json',
                        ),
                    'olufemi': (properties) => DevEmployee3NPC(
                          properties.position,
                          dialogFilename: 'DEV_floor/Olufemi Ore-DEV.json',
                        ),
                    'npc12': (properties) => FrontEndDevNPC(
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
