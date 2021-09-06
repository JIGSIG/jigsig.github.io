import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:developer/npc/robozzle_star.dart';
import 'package:flutter/material.dart';

import '../decoration/barrel_dragable.dart';
import '../decoration/chest.dart';
import '../decoration/spikes.dart';
import '../decoration/torch.dart';

class RoboZZleMaps {
  static double tileSize = 45;
  //static final Future<Sprite> wallBottom = Sprite.load('tile/wall_bottom
  // .png');
  //static final Future<Sprite> wall = Sprite.load('tile/wall.png');
  //static final Future<Sprite> wallTop = Sprite.load('tile/wall_top.png');
  //static final Future<Sprite> wallLeft = Sprite.load('tile/wall_left.png');
  //static final Future<Sprite> wallBottomLeft =
  //    Sprite.load('tile/wall_bottom_left.png');
  //static final Future<Sprite> wallRight = Sprite.load('tile/wall_right.png');
  static final Future<Sprite> floor_1 = Sprite.load('tile/floor_1.png');

  static MapWorld map10() {
    List<Tile> tileList = [];
    List.generate(20, (indexRow) {
      List.generate(20, (indexColumm) {
        if (indexRow == 5 && indexColumm < 7) {
          tileList.add(
            Tile.fromSprite(
              randomFloor(),
              Vector2(indexColumm.toDouble(), indexRow.toDouble()),
              width: tileSize,
              height: tileSize,
            ),
          );
        }
        if (indexRow == 6 && (indexColumm == 6 || indexColumm == 0)) {
          tileList.add(
            Tile.fromSprite(
              randomFloor(),
              Vector2(indexColumm.toDouble(), indexRow.toDouble()),
              width: tileSize,
              height: tileSize,
            ),
          );
        }
        if (indexRow == 7 && indexColumm < 7 && indexColumm != 3) {
          tileList.add(
            Tile.fromSprite(
              randomFloor(),
              Vector2(indexColumm.toDouble(), indexRow.toDouble()),
              width: tileSize,
              height: tileSize,
            ),
          );
        }
      });
    });

    return MapWorld(tileList);
  }

  static List<GameDecoration> decorations() {
    return [
      Spikes(
        getRelativeTilePosition(7, 7),
      ),
      BarrelDraggable(getRelativeTilePosition(8, 6)),
      GameDecorationWithCollision.withSprite(
        Sprite.load('itens/barrel.png'),
        getRelativeTilePosition(10, 6),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize / 1.5, tileSize / 1.5))
        ],
      ),
      Chest(getRelativeTilePosition(18, 7)),
      GameDecorationWithCollision.withSprite(
        Sprite.load('itens/table.png'),
        getRelativeTilePosition(15, 7),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize, tileSize * 0.8)),
        ],
      ),
      GameDecorationWithCollision.withSprite(
        Sprite.load('itens/table.png'),
        getRelativeTilePosition(27, 6),
        width: tileSize,
        height: tileSize,
        collisions: [
          CollisionArea.rectangle(size: Size(tileSize, tileSize * 0.8)),
        ],
      ),
      Torch(getRelativeTilePosition(4, 4)),
      Torch(getRelativeTilePosition(12, 4)),
      Torch(getRelativeTilePosition(20, 4)),
      Torch(getRelativeTilePosition(28, 4)),
      GameDecoration.withSprite(
        Sprite.load('itens/flag_red.png'),
        position: getRelativeTilePosition(24, 4),
        width: tileSize,
        height: tileSize,
      ),
      GameDecoration.withSprite(
        Sprite.load('itens/flag_red.png'),
        position: getRelativeTilePosition(6, 4),
        width: tileSize,
        height: tileSize,
      ),
      GameDecoration.withSprite(
        Sprite.load('itens/prisoner.png'),
        position: getRelativeTilePosition(10, 4),
        width: tileSize,
        height: tileSize,
      ),
      GameDecoration.withSprite(
        Sprite.load('itens/flag_red.png'),
        position: getRelativeTilePosition(14, 4),
        width: tileSize,
        height: tileSize,
      )
    ];
  }

  static List<NPC> stars10() {
    return [
      RoboZZleStar(getRelativeTilePosition(2, 7)),
      RoboZZleStar(getRelativeTilePosition(0, 7)),
      RoboZZleStar(getRelativeTilePosition(6, 7)),
      RoboZZleStar(getRelativeTilePosition(0, 5)),
      RoboZZleStar(getRelativeTilePosition(3, 5)),
      RoboZZleStar(getRelativeTilePosition(6, 5)),
    ];
  }

  static Future<Sprite> randomFloor() {
    int p = Random().nextInt(6);
    switch (p) {
      case 0:
        return floor_1;
      case 1:
        return floor_1;
      case 2:
        return floor_1;
      case 3:
        return floor_1;
      case 4:
        return floor_1;
      case 5:
        return floor_1;
      default:
        return floor_1;
    }
  }

  static Vector2 getRelativeTilePosition(int x, int y) {
    return Vector2(
      (x * tileSize + 5).toDouble(),
      (y * tileSize * .95).toDouble(),
    );
  }
}
