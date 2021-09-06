import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/tiled/tiled_world_map.dart';
import 'package:bonfire/widgets/bonfire_tiled_widget.dart';
import 'package:developer/Qu%C3%AAtes/Qu%C3%AAte-1.dart';
import 'package:developer/decoration/elevatorButton.dart';
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

class ReceptionMap extends StatefulWidget {
  final bool initState;
  final PlatformType platformType;

  const ReceptionMap({
    Key? key,
    this.initState = false,
    required this.platformType,
  }) : super(key: key);

  @override
  _ReceptionMapState createState() => _ReceptionMapState();
}

class _ReceptionMapState extends State<ReceptionMap> {
  late final Vector2 playerSpawn;
  bool loading = true;
  bool quest1 = false;
  final String map = "maps/reception/reception.json";

  @override
  void initState() {
    checkQuestAvailable();
    findPlayerLocation(map: "assets/images/$map", isElevator: !widget.initState)
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
    return LayoutBuilder(
      builder: (context, constraints) {
        mapTileSize = max(constraints.maxHeight, constraints.maxWidth) /
            (kIsWeb ? 35 : 22);
        if (loading == false)
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
                  'maps/reception/reception.json',
                  forceTileSize: Size(mapTileSize, mapTileSize),
                  objectsBuilder: {
                    'receptioniste': (properties) => ReceptionNPC(
                          properties.position,
                          dialogFilename: 'Reception/folami-reception.json',
                        ),
                    'elevatorButton': (properties) => ElevatorButton(
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
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
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
