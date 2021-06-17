import 'package:flutter/material.dart';
import 'package:reveri_website/ui/common/forum_details_widget.dart';
import 'package:reveri_website/ui/common/forum_name_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class MenuCard extends StatelessWidget {
  final Game game;

  MenuCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        html.window.open(game.url,"_self");
      },
      child: SizedBox(
        width: 300.0,
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
  final String url;

  Game({
    required this.title,
    required this.imagePath,
    required this.rank,
    required this.completed,
    required this.stars,
    required this.games,
    required this.url,
  });
}

final fortniteMenu = Game(
  title: "Chef de projet digital",
  imagePath: "assets/images/digital_project_manager.jpeg",
  rank: 31,
  completed: 112,
  stars: 4,
  games: 600,
  url: "https://jigsig.github.io/reveri_games/digital_project_manager/",
);

final pubgMenu = Game(
  title: "Développeur",
  imagePath: "assets/images/developer.jpeg",
  rank: 25,
  completed: 488,
  stars: 2.5,
  games: 1000,
  url: "https://jigsig.github.io/reveri_games/example/build/web/",
);

final games = [
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
  fortniteMenu,
  pubgMenu,
];
