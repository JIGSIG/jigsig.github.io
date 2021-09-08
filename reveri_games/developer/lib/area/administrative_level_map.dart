import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/isometric/isometric_world_map.dart';
import 'package:bonfire/widgets/bonfire_isometric_widget.dart';
import 'package:developer/Quests/Quest1.dart';
import 'package:developer/decoration/elevatorButton.dart';
import 'package:developer/npc/admin-employees/employee1.dart';
import 'package:developer/npc/admin-employees/employee2.dart';
import 'package:developer/npc/admin-employees/employee3.dart';
import 'package:developer/npc/admin-employees/ThomasAndre.dart';
import 'package:developer/npc/admin-employees/employee5.dart';
import 'package:developer/npc/back_end_dev.dart';
import 'package:developer/npc/front_end_dev.dart';
import 'package:developer/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../npc/client.dart';
import '../player/joueur.dart';

class AdministrativeMap extends StatefulWidget {
  final int map;
  final PlatformType platformType;

  const AdministrativeMap({
    Key? key,
    this.map = 1,
    required this.platformType,
  }) : super(key: key);

  @override
  _AdministrativeMapState createState() => _AdministrativeMapState();
}

class _AdministrativeMapState extends State<AdministrativeMap> {
  late final Vector2 playerSpawn;
  bool loading = true;
  final String map = "maps/administrative_area/admin.json";
  final String map2 = "sample.json";

  @override
  void initState() {
    findPlayerLocation(map: "assets/images/$map").then((value) {
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
                      sprite: Sprite.load('A1.png'),
                      align: JoystickActionAlign.BOTTOM_RIGHT,
                      size: 70,
                      margin: EdgeInsets.only(bottom: 60, right: 100),
                    ),
                  ],
                ),
                player: Joueur(playerSpawn),
                map: TiledWorldMap(
                  map,
                  forceTileSize: Size(mapTileSize, mapTileSize),
                  objectsBuilder: {
                    'employee-1': (properties) => AdminEmployee1NPC(
                          properties.position,
                          dialogFilename:
                              'Office_floor/Drakkarmin-employéeBTM.json',
                        ),
                    'employee-2': (properties) => AdminEmployee2NPC(
                          properties.position,
                          dialogFilename: 'Office_floor/Hervé-employéeBTM.json',
                        ),
                    'employee-3': (properties) => AdminEmployee3NPC(
                          properties.position,
                          dialogFilename: 'Office_floor/Joy-AssistantDRH.json',
                        ),
                    'employee-4': (properties) => AdminEmployee4NPC(
                          properties.position,
                          dialogFilename: 'Office_floor/ThomasAndré-DRH.json',
                        ),
                    'employee-5': (properties) => AdminEmployee5NPC(
                          properties.position,
                          dialogFilename: 'client.json',
                        ),
                  },
                ),
                background: BackgroundColorGame(Colors.black),
                lightingColorGame: Colors.black.withOpacity(0.1),
              ),
              // BonfireIsometricWidget(
              //   joystick: Joystick(
              //     keyboardEnable: true,
              //     directional: JoystickDirectional(
              //       spriteBackgroundDirectional: Sprite.load(
              //         'joystick_background.png',
              //       ),
              //       spriteKnobDirectional: Sprite.load('joystick_knob.png'),
              //       size: 100,
              //       isFixed: true,
              //     ),
              //     actions: [
              //       JoystickAction(
              //         actionId: PlayerActionType.Interaction,
              //         sprite: Sprite.load('A1.png'),
              //         align: JoystickActionAlign.BOTTOM_RIGHT,
              //         size: 70,
              //         margin: EdgeInsets.only(bottom: 60, right: 100),
              //       ),
              //     ],
              //   ),
              //   map: IsometricWorldMap(
              //     map2,
              //     forceTileSize: Size(mapTileSize, mapTileSize),
              //   ),
              // ),
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
              // if (quest1 == true) questWidget(context, 1),
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
}
