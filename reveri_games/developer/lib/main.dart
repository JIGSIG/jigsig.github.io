import 'dart:async';

import 'package:developer/area/reception_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
  runApp(DevApp());
}

class DevApp extends StatelessWidget {
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
          ReceptionMap(
            platformType: new PlatformType(isIos: true),
            initState: true,
          ),
          Positioned(
            top: 25,
            right: 25,
            child: GameTime(),
          ),
        ],
      ),
    );
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
