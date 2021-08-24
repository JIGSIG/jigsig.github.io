import 'dart:ui';

import 'package:flame/components.dart';

class IsometricObjectProperties {
  final Vector2 position;
  final Size size;
  final double? rotation;
  final String? type;
  final Map<String, dynamic> others;

  IsometricObjectProperties(
    this.position,
    this.size,
    this.type,
    this.rotation,
    this.others,
  );
}
