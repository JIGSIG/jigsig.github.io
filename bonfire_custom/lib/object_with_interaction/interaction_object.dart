import 'dart:math';

import 'package:bonfire/base/game_component.dart';
import 'package:bonfire/collision/object_collision.dart';
import 'package:bonfire/util/interval_tick.dart';
import 'package:bonfire/util/mixins/attackable.dart';
import 'package:bonfire/util/mixins/move_to_position_along_the_path.dart';
import 'package:bonfire/util/mixins/movement.dart';
import 'package:bonfire/util/vector2rect.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../objects/animated_object.dart';
import '../util/direction.dart';
import '../util/mixins/attackable.dart';

/// It is used to represent your enemies.
class InteractionObject extends GameComponent
    with Movement, Attackable, MoveToPositionAlongThePath {
  /// Life of the InteractionObject.
  double life;

  /// Max life of the InteractionObject.
  late double maxLife;

  /// Movement speed of the InteractionObject (pixel per second).
  double speed;

  /// Check if the InteractionObject is interacting (pixel per second).
  bool isInteracting = false;

  bool _isDead = false;

  /// Map available to store times that can be used to control the frequency of any action.
  Map<String, IntervalTick> timers = Map();

  bool wasMoving = false;

  InteractionObject({
    required Vector2 position,
    required double height,
    required double width,
    this.life = 10,
    this.speed = 100,
  }) {
    receivesAttackFrom = ReceivesAttackFromEnum.PLAYER;
    maxLife = life;
    this.position = Vector2Rect.fromRect(
      Rect.fromLTWH(
        position.x,
        position.y,
        width,
        height,
      ),
    );
  }

  bool get isDead => _isDead;

  /// Move InteractionObject to direction by radAngle with dodge obstacles
  void moveFromAngleDodgeObstacles(
    double speed,
    double angle, {
    Function? notMove,
  }) {
    isIdle = false;
    double innerSpeed = (speed * dtUpdate);
    double nextX = innerSpeed * cos(angle);
    double nextY = innerSpeed * sin(angle);
    Offset nextPoint = Offset(nextX, nextY);

    Offset diffBase = Offset(position.center.dx + nextPoint.dx,
            position.center.dy + nextPoint.dy) -
        position.center;

    var collisionX = verifyInteractionObjectTranslateCollision(
      diffBase.dx,
      0,
    );
    var collisionY = verifyInteractionObjectTranslateCollision(
      0,
      diffBase.dy,
    );

    Offset newDiffBase = diffBase;

    if (collisionX) {
      newDiffBase = Offset(0, newDiffBase.dy);
    }
    if (collisionY) {
      newDiffBase = Offset(newDiffBase.dx, 0);
    }

    if (collisionX && !collisionY && newDiffBase.dy != 0) {
      var collisionY = verifyInteractionObjectTranslateCollision(
        0,
        innerSpeed,
      );
      if (!collisionY) newDiffBase = Offset(0, innerSpeed);
    }

    if (collisionY && !collisionX && newDiffBase.dx != 0) {
      var collisionX = verifyInteractionObjectTranslateCollision(
        innerSpeed,
        0,
      );
      if (!collisionX) newDiffBase = Offset(innerSpeed, 0);
    }

    if (newDiffBase == Offset.zero) {
      notMove?.call();
    }
    this.position = position.shift(newDiffBase);
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    if (life > 0) {
      life -= damage;
      if (life <= 0) {
        die();
      }
    }
  }

  @override
  void receiveInteraction(interactionType type, dynamic from,
      {Direction? direction, List? options}) {
    switch (direction) {
      case Direction.left:
        this.moveRight(0);
        break;
      case Direction.right:
        this.moveLeft(0);
        break;
      case Direction.up:
        this.moveDown(0);
        break;
      case Direction.upLeft:
        this.moveDown(0);
        break;
      case Direction.upRight:
        this.moveDown(0);
        break;
      case Direction.down:
        this.moveUp(0);
        break;
      case Direction.downLeft:
        this.moveUp(0);
        break;
      case Direction.downRight:
        this.moveUp(0);
        break;
      default:
        this.moveDown(0);
        break;
    }
    this.idle();
  }

  /// increase life in the InteractionObject
  void addLife(double life) {
    this.life += life;
    if (this.life > maxLife) {
      this.life = maxLife;
    }
  }

  /// marks the InteractionObject as dead
  void die() {
    _isDead = true;
  }

  /// Checks whether you entered a certain configured interval
  /// Used in flows involved in the [update]
  bool checkPassedInterval(String name, int intervalInMilli, double dt) {
    if (this.timers[name]?.interval != intervalInMilli) {
      this.timers[name] = IntervalTick(intervalInMilli);
      return true;
    } else {
      return this.timers[name]?.update(dt) ?? false;
    }
  }

  /// Check if performing a certain translate on the InteractionObject collision occurs
  bool verifyInteractionObjectTranslateCollision(
    double translateX,
    double translateY,
  ) {
    if (this.isObjectCollision()) {
      return (this as ObjectCollision).isCollision(
        displacement: this.position.translate(translateX, translateY),
      );
    } else {
      return false;
    }
  }

  void moveTo(Vector2 position) {
    print('InteractionObject moving to position ($position)');
    this.moveToPositionAlongThePath(position, speed);
    wasMoving = true;
  }

  void actionAtDestination() {}
}
