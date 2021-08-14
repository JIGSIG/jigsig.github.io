import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:developer/main.dart';

import '../util/common_sprite_sheet.dart';

enum door_part {
  TL,
  TR,
  BL,
  BR,
}

class JapaneseDoorDecoration extends GameDecoration with ObjectCollision {
  double attack = 20;
  bool _seePlayerClose = false;
  final door_part doorpart;
  Sprite? spriteO;
  Sprite? spriteC;

  JapaneseDoorDecoration(Vector2 position, this.doorpart)
      : super.withSprite(
          determineGoodSprite(doorpart),
          position: position,
          width: mapTileSize,
          height: mapTileSize,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(mapTileSize, mapTileSize),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
    switch (doorpart) {
      case door_part.TL:
        CommonSpriteSheet.doorTLO.then((value) {
          spriteO = value;
        });
        CommonSpriteSheet.doorTLC.then((value) {
          spriteC = value;
        });
        break;
      case door_part.TR:
        CommonSpriteSheet.columnSprite.then((value) {
          spriteO = value;
        });
        CommonSpriteSheet.barrelSprite.then((value) {
          spriteC = value;
        });
        break;
      case door_part.BL:
        CommonSpriteSheet.columnSprite.then((value) {
          spriteO = value;
        });
        CommonSpriteSheet.barrelSprite.then((value) {
          spriteC = value;
        });
        break;
      case door_part.BR:
        CommonSpriteSheet.columnSprite.then((value) {
          spriteO = value;
        });
        CommonSpriteSheet.barrelSprite.then((value) {
          spriteC = value;
        });
        break;
    }
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    _seePlayerClose = false;
    this.seePlayer(
      radiusVision:
          doorpart == door_part.BL || doorpart == door_part.BR ? 25 : 60,
      observed: (player) async {
        _seePlayerClose = true;
        this.sprite = spriteO;
      },
    );
    if (!_seePlayerClose) {
      this.sprite = spriteC;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //this.drawDefaultLifeBar(canvas);
  }

  static Future<Sprite> determineGoodSprite(door_part doorpart) {
    switch (doorpart) {
      case door_part.TL:
        return CommonSpriteSheet.doorTLC;
      case door_part.TR:
        return CommonSpriteSheet.doorTLC;
      case door_part.BL:
        return CommonSpriteSheet.doorTLC;
      case door_part.BR:
        return CommonSpriteSheet.doorTLC;
    }
  }
}
