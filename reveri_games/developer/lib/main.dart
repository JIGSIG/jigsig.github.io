import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:developer/area/reception_map.dart';
import 'package:developer/game_interface/Laptop_Nathalie.dart';
import 'package:developer/game_interface/binary10001.dart';
import 'package:developer/game_interface/choiceGame.dart';
import 'package:developer/game_interface/laptop_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Sound/sound.dart';

double mapTileSize = 16;

class PlatformType {
  final bool isIos;
  final bool isAndroid;
  final bool isWeb;
  final bool init;

  PlatformType({
    this.init = false,
    this.isIos = false,
    this.isAndroid = false,
    this.isWeb = false,
  });
}

late final PlatformType? platformType;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChoiceGame(),
  ));
}

class DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurrentMapWithInterface(
      gameMap: ReceptionMap(
        initState: true,
        platformType: new PlatformType(isIos: true),
      ),
    );
  }
}

class CurrentMapWithInterface extends StatelessWidget {
  final Widget gameMap;
  const CurrentMapWithInterface({Key? key, required this.gameMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          gameMap,
          Positioned(
            top: 25,
            right: 25,
            child: GameTime(),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: CurrentQuestInterface(),
          ),
        ],
      ),
    );
  }
}

class CurrentQuestInterface extends StatefulWidget {
  const CurrentQuestInterface({Key? key}) : super(key: key);

  @override
  _CurrentQuestInterfaceState createState() => _CurrentQuestInterfaceState();
}

class _CurrentQuestInterfaceState extends State<CurrentQuestInterface> {
  SharedPreferences? preferences;
  late Timer timer;

  String currentQuest = '';

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentQuest());
    super.initState();
  }

  void _getCurrentQuest() {
    setState(() {
      currentQuest = getCurrentQuest();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              child: Text(
                "Objectif:\n\n${getCurrentQuest()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCurrentQuest() {
    if (preferences == null) return "Rendez-vous au Bureau de Thomas André.";
    int index = preferences?.getInt('QuestIndex') ?? 1;
    switch (index) {
      case 1:
        return "Parler au Directeur des Ressources Humaines dans son bureau";
      case 2:
        return "Rendez-vous dans l'espace de développement et trouver Sebastian ou Etienne afin de récupérer vos codes d’accès";
      case 3:
        return "Faire un contrôle sur votre machine de travail";
      case 4:
        return "Parlez à Etienne";
      case 5:
        return "Retrouvez Nathalie caché quelque part dans l’immeuble";
      case 6:
        return "Rendez-vous en salle de Briefing";
      case 7:
        return "Rejoignez votre poste afin de prendre connaissance de vos tâches du jour";
      case 8:
        return "Effectuez les tâches que vous a confié Nathalie";
      case 9:
        return "Faites votre rapport à Nathalie";
      case 10:
        return "Rendez-vous en salle de Briefing pour suivre la réunion à la place de Nathalie";
      default:
        return "Rendez-vous au Bureau de Thomas André.";
    }
  }
}

class GameTime extends StatefulWidget {
  const GameTime({Key? key}) : super(key: key);

  @override
  _GameTimeState createState() => _GameTimeState();
}

class _GameTimeState extends State<GameTime> {
  late String _timeString = '';
  late Timer timer;

  @override
  void initState() {
    initializeDateFormatting().then((value) {
      _getTime();
      timer = Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());
    });
    super.initState();
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('HH:mm', 'fr').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Text(
          _timeString,
          style: TextStyle(
            fontFamily: 'Kindapix',
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
