import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:digital_project_manager/main.dart';
import 'package:flutter/material.dart';

import '../util/common_sprite_sheet.dart';

class BarrelDraggable extends GameDecoration with DragGesture, ObjectCollision {
  late TextPaint _textConfig;

  BarrelDraggable(Vector2 position)
      : super.withSprite(
          CommonSpriteSheet.barrelSprite,
          position: position,
          width: mapTileSize,
          height: mapTileSize,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(
              mapTileSize * 0.6,
              mapTileSize * 0.4,
            ),
            align: Vector2(
              mapTileSize * 0.2,
              mapTileSize * 0.4,
            ),
          ),
        ],
      ),
    );
    _textConfig = TextPaint(
      config: TextPaintConfig(color: Colors.white, fontSize: width / 4),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _textConfig.render(
      canvas,
      'Drag',
      Vector2(this.position.left + width / 5, this.position.top - width / 3),
    );
  }
}
