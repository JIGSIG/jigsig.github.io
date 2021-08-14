import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/collision/collision_config.dart';
import 'package:bonfire/collision/object_collision.dart';
import 'package:bonfire/lighting/lighting_config.dart';
import 'package:bonfire/object_with_interaction/extensions.dart';
import 'package:bonfire/object_with_interaction/simple/simple_interaction_object.dart';
import 'package:bonfire/objects/animated_object_once.dart';
import 'package:bonfire/objects/flying_attack_object.dart';
import 'package:bonfire/player/player.dart';
import 'package:bonfire/util/direction.dart';
import 'package:bonfire/util/vector2rect.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

import '../../util/direction.dart';

extension SimpleInteractionObjectExtensions on SimpleInteractionObject {
  static bool go = true;
  static Vector2 playerPosition = Vector2(0, 0);

  /// Checks whether the player is within range. If so, move to it.
  void seeAndMoveToPlayer({
    required Function(Player) closePlayer,
    double radiusVision = 32,
    double margin = 10,
    bool runOnlyVisibleInScreen = true,
  }) {
    if (isDead) return;
    if (runOnlyVisibleInScreen && !this.isVisibleInCamera()) return;

    seePlayer(
      radiusVision: radiusVision,
      observed: (player) {
        double centerXPlayer = playerRect.center.dx;
        double centerYPlayer = playerRect.center.dy;

        double translateX = 0;
        double translateY = 0;
        double speed = this.speed * this.dtUpdate;

        Vector2Rect rectToMove = this.isObjectCollision()
            ? (this as ObjectCollision).rectCollision
            : position;

        translateX =
            rectToMove.rect.center.dx > centerXPlayer ? (-1 * speed) : speed;

        translateX = _adjustTranslate(
          translateX,
          rectToMove.rect.center.dx,
          centerXPlayer,
          speed,
        );
        translateY =
            rectToMove.rect.center.dy > centerYPlayer ? (-1 * speed) : speed;
        translateY = _adjustTranslate(
          translateY,
          rectToMove.rect.center.dy,
          centerYPlayer,
          speed,
        );

        if ((translateX < 0 && translateX > -0.1) ||
            (translateX > 0 && translateX < 0.1)) {
          translateX = 0;
        }

        if ((translateY < 0 && translateY > -0.1) ||
            (translateY > 0 && translateY < 0.1)) {
          translateY = 0;
        }

        Rect rectPlayerCollision = Rect.fromLTWH(
          playerRect.left - margin,
          playerRect.top - margin,
          playerRect.width + (margin * 2),
          playerRect.height + (margin * 2),
        );

        if (rectToMove.rect.overlaps(rectPlayerCollision)) {
          closePlayer(player);
          if (!this.isIdle) {
            this.idle();
          }
          return;
        }

        translateX = translateX / this.dtUpdate;
        translateY = translateY / this.dtUpdate;

        if (translateX > 0 && translateY > 0) {
          this.moveDownRight(translateX, translateY);
        } else if (translateX < 0 && translateY < 0) {
          this.moveUpLeft(translateX.abs(), translateY.abs());
        } else if (translateX > 0 && translateY < 0) {
          this.moveUpRight(translateX, translateY.abs());
        } else if (translateX < 0 && translateY > 0) {
          this.moveDownLeft(translateX.abs(), translateY);
        } else {
          if (translateX > 0) {
            this.moveRight(translateX);
          } else if (translateX < 0) {
            moveLeft(translateX.abs());
          }
          if (translateY > 0) {
            moveDown(translateY);
          } else if (translateY < 0) {
            moveUp(translateY.abs());
          }
        }
      },
      notObserved: () {
        if (!this.isIdle) {
          this.idle();
        }
      },
    );
  }

  void moveAlongPathToPlayer(Player player) {}

  bool isClosedToPlayer({double margin = 10, required Function() action}) {
    Rect rectPlayerCollision = Rect.fromLTWH(
      playerRect.left - margin,
      playerRect.top - margin,
      playerRect.width + (margin * 2),
      playerRect.height + (margin * 2),
    );

    Vector2Rect rectToMove = this.isObjectCollision()
        ? (this as ObjectCollision).rectCollision
        : position;

    if (rectToMove.rect.overlaps(rectPlayerCollision)) {
      this.idle();
      action();
      print('isClosedToPlayer');
      return true;
    }
    return false;
  }

  void turnToSeePlayer({
    required Function(Player) closePlayer,
    double radiusVision = 32,
    double margin = 10,
    bool runOnlyVisibleInScreen = true,
  }) {
    if (isDead) return;
    if (runOnlyVisibleInScreen && !this.isVisibleInCamera()) return;

    seePlayer(
      radiusVision: radiusVision,
      observed: (player) {
        moveUp(0);
        idle();
      },
      notObserved: () {
        if (!this.isIdle) {
          this.idle();
        }
      },
    );
  }

  void simpleInteractionInChat({
    dynamic id,
    List? options,
    VoidCallback? execute,
    Direction? direction,
  }) {
    if (isDead) return;
    gameRef.player?.receiveInteraction(interactionType.ANSWER_RESQUESTED, id,
        direction: direction, options: options);
  }

  void endInteraction({
    dynamic id,
    VoidCallback? execute,
    Direction? direction,
  }) {
    if (isDead) return;
    gameRef.player
        ?.receiveInteraction(interactionType.END, id, direction: direction);
  }

  ///Execute simple attack melee using animation
  void simpleAttackMelee({
    required double damage,
    required double height,
    required double width,
    int? id,
    int interval = 1000,
    bool withPush = false,
    double? sizePush,
    Direction? direction,
    Future<SpriteAnimation>? attackEffectRightAnim,
    Future<SpriteAnimation>? attackEffectBottomAnim,
    Future<SpriteAnimation>? attackEffectLeftAnim,
    Future<SpriteAnimation>? attackEffectTopAnim,
    VoidCallback? execute,
  }) {
    if (!this.checkPassedInterval('attackMelee', interval, dtUpdate)) return;

    if (isDead) return;

    Rect positionAttack;
    Future<SpriteAnimation>? anim;

    Direction playerDirection;

    Vector2Rect rectToMove = this.isObjectCollision()
        ? (this as ObjectCollision).rectCollision
        : position;

    if (direction == null) {
      double centerXPlayer = playerRect.center.dx;
      double centerYPlayer = playerRect.center.dy;

      double centerYInteractionObject = rectToMove.rect.center.dy;
      double centerXInteractionObject = rectToMove.rect.center.dx;

      double diffX = centerXInteractionObject - centerXPlayer;
      double diffY = centerYInteractionObject - centerYPlayer;

      double positiveDiffX = diffX > 0 ? diffX : diffX * -1;
      double positiveDiffY = diffY > 0 ? diffY : diffY * -1;
      if (positiveDiffX > positiveDiffY) {
        playerDirection = diffX > 0 ? Direction.left : Direction.right;
      } else {
        playerDirection = diffY > 0 ? Direction.up : Direction.down;
      }
    } else {
      playerDirection = direction;
    }

    double pushLeft = 0;
    double pushTop = 0;
    switch (playerDirection) {
      case Direction.up:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.center.dx - width / 2,
          rectToMove.rect.top - height,
          width,
          height,
        );
        if (attackEffectTopAnim != null) anim = attackEffectTopAnim;
        pushTop = (sizePush ?? height) * -1;
        break;
      case Direction.right:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.right,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectRightAnim != null) anim = attackEffectRightAnim;
        pushLeft = (sizePush ?? width);
        break;
      case Direction.down:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.center.dx - width / 2,
          rectToMove.rect.bottom,
          width,
          height,
        );
        if (attackEffectBottomAnim != null) anim = attackEffectBottomAnim;
        pushTop = (sizePush ?? height);
        break;
      case Direction.left:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.left - width,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectLeftAnim != null) anim = attackEffectLeftAnim;
        pushLeft = (sizePush ?? width) * -1;
        break;
      case Direction.upLeft:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.left - width,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectLeftAnim != null) anim = attackEffectLeftAnim;
        pushLeft = (sizePush ?? width) * -1;
        break;
      case Direction.upRight:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.right,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectRightAnim != null) anim = attackEffectRightAnim;
        pushLeft = (sizePush ?? width);
        break;
      case Direction.downLeft:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.left - width,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectLeftAnim != null) anim = attackEffectLeftAnim;
        pushLeft = (sizePush ?? width) * -1;
        break;
      case Direction.downRight:
        positionAttack = Rect.fromLTWH(
          rectToMove.rect.right,
          rectToMove.rect.center.dy - height / 2,
          width,
          height,
        );
        if (attackEffectRightAnim != null) anim = attackEffectRightAnim;
        pushLeft = (sizePush ?? width);
        break;
    }

    if (anim != null) {
      gameRef.add(
        AnimatedObjectOnce(
          animation: anim,
          position: positionAttack.toVector2Rect(),
        ),
      );
    }

    gameRef.visibleAttackables().where((a) {
      return a.receivesAttackFromNpc() &&
          a.rectAttackable().rect.overlaps(positionAttack);
    }).forEach((attackable) {
      attackable.receiveDamage(damage, id);

      Vector2Rect rectAfterPush = attackable.position.translate(
        pushLeft,
        pushTop,
      );

      if (withPush &&
          (attackable is ObjectCollision &&
              !(attackable as ObjectCollision)
                  .isCollision(displacement: rectAfterPush))) {
        attackable.position = rectAfterPush;
      }
    });

    execute?.call();
  }

  /// Execute the ranged attack using a component with animation
  void simpleAttackRange({
    required Future<SpriteAnimation> animationRight,
    required Future<SpriteAnimation> animationLeft,
    required Future<SpriteAnimation> animationUp,
    required Future<SpriteAnimation> animationDown,
    required Future<SpriteAnimation> animationDestroy,
    required double width,
    required double height,
    int? id,
    double speed = 150,
    double damage = 1,
    Direction? direction,
    int interval = 1000,
    bool withCollision = true,
    CollisionConfig? collision,
    VoidCallback? destroy,
    VoidCallback? execute,
    LightingConfig? lightingConfig,
  }) {
    if (!this.checkPassedInterval('attackRange', interval, dtUpdate)) return;

    if (isDead) return;

    Vector2 startPosition;
    Future<SpriteAnimation> attackRangeAnimation;

    late Direction ballDirection;

    Vector2Rect rectToMove = this.isObjectCollision()
        ? (this as ObjectCollision).rectCollision
        : position;

    var diffX = rectToMove.rect.center.dx - playerRect.center.dx;
    var diffPositiveX = diffX < 0 ? diffX *= -1 : diffX;
    var diffY = rectToMove.rect.center.dy - playerRect.center.dy;
    var diffPositiveY = diffY < 0 ? diffY *= -1 : diffY;

    if (diffPositiveX > diffPositiveY) {
      if (playerRect.center.dx > rectToMove.rect.center.dx) {
        ballDirection = Direction.right;
      } else if (playerRect.center.dx < rectToMove.rect.center.dx) {
        ballDirection = Direction.left;
      }
    } else {
      if (playerRect.center.dy > rectToMove.rect.center.dy) {
        ballDirection = Direction.down;
      } else if (playerRect.center.dy < rectToMove.rect.center.dy) {
        ballDirection = Direction.up;
      }
    }

    Direction finalDirection = direction != null ? direction : ballDirection;

    switch (finalDirection) {
      case Direction.left:
        attackRangeAnimation = animationLeft;
        startPosition = Vector2(
          rectToMove.rect.left - width,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
      case Direction.right:
        attackRangeAnimation = animationRight;
        startPosition = Vector2(
          rectToMove.rect.right,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
      case Direction.up:
        attackRangeAnimation = animationUp;
        startPosition = Vector2(
          (rectToMove.rect.left + (rectToMove.rect.width - width) / 2),
          rectToMove.rect.top - height,
        );
        break;
      case Direction.down:
        attackRangeAnimation = animationDown;
        startPosition = Vector2(
          (rectToMove.rect.left + (rectToMove.rect.width - width) / 2),
          rectToMove.rect.bottom,
        );
        break;
      case Direction.upLeft:
        attackRangeAnimation = animationLeft;
        startPosition = Vector2(
          rectToMove.rect.left - width,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
      case Direction.upRight:
        attackRangeAnimation = animationRight;
        startPosition = Vector2(
          rectToMove.rect.right,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
      case Direction.downLeft:
        attackRangeAnimation = animationLeft;
        startPosition = Vector2(
          rectToMove.rect.left - width,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
      case Direction.downRight:
        attackRangeAnimation = animationRight;
        startPosition = Vector2(
          rectToMove.rect.right,
          (rectToMove.rect.top + (rectToMove.rect.height - height) / 2),
        );
        break;
    }

    this.lastDirection = finalDirection;
    if (finalDirection == Direction.right || finalDirection == Direction.left) {
      this.lastDirectionHorizontal = finalDirection;
    }

    gameRef.add(
      FlyingAttackObject(
        id: id,
        direction: finalDirection,
        flyAnimation: attackRangeAnimation,
        destroyAnimation: animationDestroy,
        position: startPosition,
        height: height,
        width: width,
        damage: damage,
        speed: speed,
        onDestroyedObject: destroy,
        withDecorationCollision: withCollision,
        collision: collision,
        lightingConfig: lightingConfig,
      ),
    );

    if (execute != null) execute();
  }

  /// Checks whether the player is within range. If so, move to it.
  void seeAndMoveToAttackRange({
    required Function(Player) positioned,
    double radiusVision = 32,
    double? minDistanceFromPlayer,
    bool runOnlyVisibleInScreen = true,
  }) {
    if (isDead) return;
    if (runOnlyVisibleInScreen && !this.isVisibleInCamera()) return;

    double distance = (minDistanceFromPlayer ?? radiusVision);

    seePlayer(
      radiusVision: radiusVision,
      observed: (player) {
        double centerXPlayer = playerRect.center.dx;
        double centerYPlayer = playerRect.center.dy;

        double translateX = 0;
        double translateY = 0;

        double speed = this.speed * this.dtUpdate;

        Vector2Rect rectToMove = this.isObjectCollision()
            ? (this as ObjectCollision).rectCollision
            : position;

        translateX =
            rectToMove.rect.center.dx > centerXPlayer ? (-1 * speed) : speed;
        translateX = _adjustTranslate(
          translateX,
          rectToMove.rect.center.dx,
          centerXPlayer,
          speed,
        );

        translateY =
            rectToMove.rect.center.dy > centerYPlayer ? (-1 * speed) : speed;
        translateY = _adjustTranslate(
          translateY,
          rectToMove.rect.center.dy,
          centerYPlayer,
          speed,
        );

        if ((translateX < 0 && translateX > -0.1) ||
            (translateX > 0 && translateX < 0.1)) {
          translateX = 0;
        }

        if ((translateY < 0 && translateY > -0.1) ||
            (translateY > 0 && translateY < 0.1)) {
          translateY = 0;
        }

        double translateXPositive =
            rectToMove.rect.center.dx - playerRect.center.dx;
        translateXPositive = translateXPositive >= 0
            ? translateXPositive
            : translateXPositive * -1;

        double translateYPositive =
            rectToMove.rect.center.dy - playerRect.center.dy;
        translateYPositive = translateYPositive >= 0
            ? translateYPositive
            : translateYPositive * -1;

        if (translateXPositive >= distance &&
            translateXPositive > translateYPositive) {
          translateX = 0;
        } else if (translateXPositive > translateYPositive) {
          translateX = translateX * -1;
          positioned(player);
        }

        if (translateYPositive >= distance &&
            translateXPositive < translateYPositive) {
          translateY = 0;
        } else if (translateXPositive < translateYPositive) {
          translateY = translateY * -1;
          positioned(player);
        }

        if (translateX == 0 && translateY == 0) {
          if (!this.isIdle) {
            this.idle();
          }
          positioned(player);
          return;
        }

        translateX = translateX / this.dtUpdate;
        translateY = translateY / this.dtUpdate;

        if (translateX > 0 && translateY > 0) {
          this.moveDownRight(translateX, translateY);
        } else if (translateX < 0 && translateY < 0) {
          this.moveUpLeft(translateX.abs(), translateY.abs());
        } else if (translateX > 0 && translateY < 0) {
          this.moveUpRight(translateX, translateY.abs());
        } else if (translateX < 0 && translateY > 0) {
          this.moveDownLeft(translateX.abs(), translateY);
        } else {
          if (translateX > 0) {
            this.moveRight(translateX);
          } else {
            moveLeft(translateX.abs());
          }
          if (translateY > 0) {
            moveDown(translateY);
          } else {
            moveUp(translateY.abs());
          }
        }
      },
      notObserved: () {
        if (!this.isIdle) {
          this.idle();
        }
      },
    );
  }

  double _adjustTranslate(
    double translate,
    double centerInteractionObject,
    double centerPlayer,
    double speed,
  ) {
    double innerTranslate = translate;
    if (innerTranslate > 0) {
      double diffX = centerPlayer - centerInteractionObject;
      if (diffX < speed) {
        innerTranslate = diffX;
      }
    } else if (innerTranslate < 0) {
      double diffX = centerPlayer - centerInteractionObject;
      if (diffX > (speed * -1)) {
        innerTranslate = diffX;
      }
    }

    return innerTranslate;
  }
}
