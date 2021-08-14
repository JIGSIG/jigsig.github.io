import 'dart:ui';

import 'package:bonfire/base/game_component.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:bonfire/player/player.dart';
import 'package:bonfire/util/extensions.dart';
import 'package:flame/sprite.dart';

import '../collision/object_collision.dart';
import '../util/direction.dart';
import '../util/vector2rect.dart';

enum interactionType {
  STARTCHAT,
  ANSWER_RESQUESTED,
  END,
}

/// This represents a Component for your game in bonfire.
///
/// All components like [Npc],[Player] and [GameDecoration] extends this.
class AnimatedObject extends GameComponent {
  /// Animation that will be drawn on the screen.
  SpriteAnimation? animation;
  bool isInteractionObject = false;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    animation?.getSprite().renderFromVector2Rect(canvas, this.position);
  }

  @override
  void update(double dt) {
    animation?.update(dt);
    super.update(dt);
  }

  void onInteractionReceived() {}

  void endInteraction({required dynamic id}) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    gameRef.player
        ?.receiveInteraction(interactionType.END, id, direction: Direction.up);
    gameRef.camera.moveToPlayerAnimated();
  }

  Vector2Rect rectTouchable() => this.isObjectCollision()
      ? (this as ObjectCollision).rectCollision
      : position;

  void hasInteraction({bool? isInteractionObject}) {
    this.isInteractionObject = isInteractionObject ?? this.isInteractionObject;
  }
}
