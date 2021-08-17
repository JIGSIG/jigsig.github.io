import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:developer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/common_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';

enum PlayerActionType { Interaction, AttackRange }

class Joueur extends SimplePlayer with Lighting, ObjectCollision {
  double attack = 20;
  double stamina = 100;
  double initSpeed = mapTileSize * 3;
  IntervalTick _timerSeeEnemy = IntervalTick(500);
  bool showObserveEnemy = false;
  bool showTalk = false;
  double angleRadAttack = 0.0;
  Rect? rectDirectionAttack;
  Sprite? spriteDirectionAttack;
  bool execAttackRange = false;
  bool isInteracting = false;

  Joueur(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          width: mapTileSize * 1.1,
          height: mapTileSize * 1.75,
          position: position,
          initDirection: Direction.down,
          life: 200,
          speed: mapTileSize * 3,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width * 1.5,
        color: Colors.transparent,
      ),
    );
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(
              mapTileSize / 2,
              mapTileSize - 1,
            ),
            align: Vector2(
              mapTileSize / 3.5,
              mapTileSize * .8,
            ),
          )
        ],
      ),
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (isInteracting) return;
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;
    if (isInteracting) return;

    if (event.id == LogicalKeyboardKey.space.keyId &&
        event.event == ActionEvent.DOWN) {
      actionInteraction();
    }

    if (event.id == PlayerActionType.Interaction &&
        event.event == ActionEvent.DOWN) {
      actionInteraction();
    }

    super.joystickAction(event);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      GameDecoration.withSprite(
        Sprite.load('player/crypt.png'),
        position: Vector2(
          position.left,
          position.top,
        ),
        height: mapTileSize,
        width: mapTileSize,
      ),
    );
    super.die();
  }

  void actionInteraction() {
    print('actionInteraction');
    print(this.position.position);
    isInteracting = this.simpleCloseInteraction(
      height: mapTileSize / 2.0,
      width: mapTileSize / 2.0,
    );
  }

  @override
  void update(double dt) {
    if (_timerSeeEnemy.update(dt)) {}
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  void showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emoteExclamation,
        target: this,
        positionFromTarget: Rect.fromLTWH(
          18,
          -6,
          width / 2,
          height / 2,
        ).toVector2Rect(),
      ),
    );
  }

  @override
  void receiveInteraction(interactionType type, from,
      {Direction? direction, List? options}) {
    if (type == interactionType.END) {
      isInteracting = false;
      print('isInteracting = false');
    }
    if (type == interactionType.ANSWER_RESQUESTED) actionInteraction();
    super.receiveInteraction(type, from, direction: direction);
  }
}
