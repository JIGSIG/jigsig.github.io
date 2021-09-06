import 'package:bonfire/bonfire.dart';
import 'package:developer/main.dart';
import 'package:developer/util/robozzle_star_sprite_sheet.dart';

import '../util/common_sprite_sheet.dart';

class RoboZZleStar extends SimpleNPC with ObjectCollision {
  double attack = 20;
  bool _seePlayerClose = false;
  bool interactionAsked = false;
  bool isInteracting = false;
  bool waitingForPlayerToRespond = false;

  RoboZZleStar(Vector2 position)
      : super(
          animation: RoboZZleStarSpriteSheet.simpleDirectionAnimation,
          position: position,
          width: mapTileSize * 2,
          height: mapTileSize * 2,
          speed: mapTileSize * 1.6,
          initDirection: Direction.up,
          life: 100,
        );

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;
    _seePlayerClose = false;
    this.seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        die();
      },
      radiusVision: mapTileSize,
    );
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
      ),
    );
    remove();
    super.die();
  }
}
