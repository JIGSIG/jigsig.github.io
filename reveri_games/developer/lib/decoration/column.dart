import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:digital_project_manager/main.dart';

import '../util/common_sprite_sheet.dart';

class ColumnDecoration extends GameDecoration with ObjectCollision {
  ColumnDecoration(Vector2 position)
      : super.withSprite(
          CommonSpriteSheet.columnSprite,
          position: position,
          width: mapTileSize,
          height: mapTileSize * 3,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(mapTileSize, mapTileSize / 2),
            align: Vector2(0, mapTileSize * 1.8),
          ),
        ],
      ),
    );
  }
}
