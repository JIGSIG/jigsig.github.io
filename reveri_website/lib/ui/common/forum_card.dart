// ignore: avoid_web_libraries_in_flutter

import 'package:digital_project_manager/game_tiled_map.dart';
import 'package:flutter/material.dart';
import 'package:reveri_website/ui/common/forum_details_widget.dart';
import 'package:reveri_website/ui/common/forum_name_widget.dart';

class MenuCard extends StatelessWidget {
  final Game game;

  MenuCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => game.game),
        );
      },
      child: Container(
        width: 275,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 500,
                  child: Image.asset(
                    game.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: MenuDetailsWidget(forum: game),
                ),
                Positioned(
                  left: 0,
                  bottom: 80.0,
                  child: MenuNameWidget(forum: game),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Game {
  final String title;
  final String imagePath;
  final int rank;
  final int games;
  final int completed;
  final double stars;
  final Widget game;

  Game({
    required this.title,
    required this.imagePath,
    required this.rank,
    required this.completed,
    required this.stars,
    required this.games,
    required this.game,
  });
}

final digitalProjectManagerGame = Game(
  title: "Chef de projet digital",
  imagePath: "assets/images/games/digital_project_manager.jpeg",
  rank: 31,
  completed: 112,
  stars: 4.0,
  games: 600,
  game: GameTiledMap(),
);

final pubgMenu = Game(
  title: "Développeur",
  imagePath: "assets/images/games/developer.jpeg",
  rank: 25,
  completed: 488,
  stars: 2.5,
  games: 1000,
  game: Container(),
);

final games = [
  digitalProjectManagerGame,
  pubgMenu,
];
