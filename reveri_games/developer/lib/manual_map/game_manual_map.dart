import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/game_controller.dart';
import 'package:confetti/confetti.dart';
import 'package:developer/manual_map/dungeon_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../interface/knight_interface.dart';
import '../main.dart';
import '../player/joueur.dart';
import '../util/common_sprite_sheet.dart';

class RoboZZle extends StatefulWidget {
  final bool? level10Completed;
  final bool? level50Completed;
  final bool? level100Completed;

  const RoboZZle({
    Key? key,
    this.level10Completed,
    this.level50Completed,
    this.level100Completed,
  }) : super(key: key);

  @override
  _RoboZZleState createState() => _RoboZZleState();
}

class _RoboZZleState extends State<RoboZZle> {
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
    return Stack(
      children: [
        if (widget.level10Completed != true) level10(),
        if (widget.level50Completed != true && widget.level10Completed == true)
          level50(),
        if (widget.level100Completed != true && widget.level50Completed == true)
          level100(),
        if (widget.level100Completed == true) TestScreen(),
      ],
    );
  }

  Widget level10() {
    print('level 10');
    return RoboZZle10(
      callback: (bool value) {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TestScreen(),
          ),
        ).then((result) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RoboZZle(
                level10Completed: value,
              ),
            ),
          );
        });
      },
    );
  }

  Widget level50() {
    print('level 50');
    return RoboZZle10(
      callback: (bool value) {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TestScreen(),
          ),
        ).then((result) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RoboZZle(
                level10Completed: value,
                level50Completed: value,
              ),
            ),
          );
        });
      },
    );
  }

  Widget level100() {
    print('level 100');
    return RoboZZle10(
      callback: (bool value) {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TestScreen(),
          ),
        ).then((result) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RoboZZle(
                level10Completed: value,
                level50Completed: value,
                level100Completed: value,
              ),
            ),
          );
        });
      },
    );
  }
}

class RoboZZle10 extends StatelessWidget implements GameListener {
  final Function(bool) callback;
  final Vector2 playerSpawn =
      Vector2((4 * RoboZZleMaps.tileSize), (6.25 * RoboZZleMaps.tileSize));
  final GameController _controller = GameController();

  RoboZZle10({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return LayoutBuilder(builder: (context, constraints) {
      mapTileSize =
          max(constraints.maxHeight, constraints.maxWidth) / (kIsWeb ? 20 : 22);
      return BonfireWidget(
        player: Joueur(playerSpawn, direction: Direction.right),
        interface: JoueurRoboZZleInterface(),
        map: RoboZZleMaps.map10(),
        npcs: RoboZZleMaps.stars10(),
        //decorations: RoboZZleMaps.decorations(),
        background: BackgroundColorGame(Colors.blueGrey[600]!),
        components: [],
        gameController: _controller..setListener(this),
        lightingColorGame: Colors.black.withOpacity(0.25),
      );
    });
  }

  @override
  void updateGame() {
    bool out = true;
    for (Tile tile in RoboZZleMaps.map10().tiles) {
      if (tile.position.overlaps(_controller.player!.position)) {
        out = false;
        break;
      }
    }
    if (out) _resetGame();
  }

  @override
  void changeCountLiveEnemies(int count) {
    if (count == 0) {
      callback(true);
      print('callback');
    }
  }

  void _resetGame() {
    _controller.player!.position.copyWith(position: playerSpawn);
    _controller.addGameComponent(AnimatedObjectOnce(
      animation: CommonSpriteSheet.smokeExplosion,
      position: _controller.player!.position,
    ));
    _controller.player!.revive();
    _controller.player!.moveRight(1);
    _controller.player!.idle();
    _controller.addGameComponent(AnimatedObjectOnce(
      animation: CommonSpriteSheet.smokeExplosion,
      position: _controller.player!.position,
    ));
    RoboZZleMaps.stars10().forEach((star) {
      _controller.addGameComponent(AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: star.position,
      ));

      _controller.addGameComponent(
        star,
      );
    });
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late ConfettiController controllerTopCenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
    controllerTopCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50]!.withOpacity(.2),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            buildConfettiWidget(controllerTopCenter, 0),
            buildConfettiWidget(controllerTopCenter, pi / 4),
            buildConfettiWidget(controllerTopCenter, pi / 2),
            buildConfettiWidget(controllerTopCenter, pi),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/maps/robozzle/trophy.png",
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Align buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.red,
            textStyle: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Congratulations!",
            ),
          ),
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        minimumSize: Size(10, 5),
        maximumSize: Size(20, 15),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: .5,
        numberOfParticles: 10, // a lot of particles at once
        gravity: .3,
      ),
    );
  }
}
