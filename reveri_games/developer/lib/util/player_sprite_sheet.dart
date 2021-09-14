import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 6, 32.1 * 1),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 6, 32.1 * 2),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 18, 32.1 * 1),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 18, 32.1 * 2),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 12, 32.1 * 1),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 12, 32.1 * 2),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 0, 32.1 * 1),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "characters/dev_map/Edward_16x16.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(16 * 0, 32.1 * 2),
          textureSize: Vector2(16, 32.1),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        initAnimation: SimpleAnimationEnum.runDown,
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
