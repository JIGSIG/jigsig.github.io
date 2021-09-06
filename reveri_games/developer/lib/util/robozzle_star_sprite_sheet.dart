import 'package:bonfire/bonfire.dart';

class RoboZZleStarSpriteSheet {
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(0, 0),
          textureSize: Vector2(32, 48),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "maps/robozzle/console.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          texturePosition: Vector2(16, 16),
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        initAnimation: SimpleAnimationEnum.idleUp,
        runUp: runUp,
        runDown: runDown,
        runLeft: runLeft,
        runRight: runRight,
        idleUp: idleUp,
        idleDown: idleDown,
        idleLeft: idleLeft,
        idleRight: idleRight,
      );
}
