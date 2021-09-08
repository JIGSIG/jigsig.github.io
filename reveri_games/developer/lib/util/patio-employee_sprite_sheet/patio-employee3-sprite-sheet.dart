import 'package:bonfire/bonfire.dart';

class PatioEmployee3SpriteSheet {
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 6, 32 * 1),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 6, 32 * 2),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 18, 32 * 1),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 18, 32 * 2),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 12, 32 * 1),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 12, 32 * 2),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 0, 32 * 1),
          textureSize: Vector2(16, 32),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "characters/patio_map/Roki_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 0, 32 * 2),
          textureSize: Vector2(16, 32),
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
