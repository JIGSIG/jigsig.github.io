import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/game_interface/interface_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Component used to add Text in your [GameInterface]
class TextInterfaceComponent extends InterfaceComponent {
  String text;
  double? _measuredWidth;
  double? _measuredHeight;
  late TextPaint textConfig;

  TextInterfaceComponent({
    required int id,
    required Vector2 position,
    this.text = '',
    ValueChanged<bool>? onTapComponent,
    TextPaintConfig? textConfig,
  }) : super(
          id: id,
          position: position,
          width: 0.0,
          height: 0.0,
          onTapComponent: onTapComponent,
        ) {
    this.textConfig = TextPaint(config: textConfig ?? TextPaintConfig());
  }

  @override
  void render(Canvas canvas) {
    if (_measuredWidth == null) {
      _measuredWidth = textConfig.measureTextWidth(text);
      _measuredHeight = textConfig.measureTextHeight(text);
      position = position.copyWith(
        size: Vector2(_measuredWidth!, _measuredHeight!),
      );
    }

    textConfig.render(
      canvas,
      text,
      Vector2(this.position.left, this.position.top),
    );
    super.render(canvas);
  }
}
