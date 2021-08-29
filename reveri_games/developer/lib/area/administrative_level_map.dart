import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bonfire/bonfire.dart';
import 'package:developer/decoration/elevatorButton.dart';
import 'package:developer/npc/back_end_dev.dart';
import 'package:developer/npc/front_end_dev.dart';
import 'package:developer/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interface/knight_interface.dart';
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
  bool quest1 = false;
  final String map = "maps/administrative_area/admin.json";

  @override
  void initState() {
    checkQuestAvailable();
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
                interface: JoueurInterface(),
                map: TiledWorldMap(
                  map,
                  forceTileSize: Size(mapTileSize, mapTileSize),
                  objectsBuilder: {
                    'receptioniste': (properties) => ReceptionNPC(
                          properties.position,
                          dialogFilename: 'client.json',
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
        },
      );
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget questWidget(BuildContext context, int questnumber) {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: DefaultTextStyle(
          style: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(
                'Quête' '$questnumber' ': Rendez-vous au ...',
                speed: const Duration(milliseconds: 30),
              ),
            ],
            onTap: () {},
          ),
        ),
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
