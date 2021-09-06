import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:developer/main.dart';
import 'package:flutter/material.dart';

import '../player/joueur.dart';

class BarLifeComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;
  double maxStamina = 100;
  double stamina = 0;

  BarLifeComponent({Vector2? position, int? id})
      : super(
          id: id ?? 1,
          position: position ?? Vector2(20, 20),
          sprite: Sprite.load('health_ui.png'),
          width: 120,
          height: 40,
        );

  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      life = this.gameRef.player?.life ?? 0.0;
      maxLife = this.gameRef.player?.maxLife ?? 0.0;
      if (this.gameRef.player is Joueur) {
        stamina = (this.gameRef.player as Joueur).stamina;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawLife(c);
      _drawStamina(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawLife(Canvas canvas) {
    double xBar = position.left + 26;
    double yBar = position.top + 10;
    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarLife, yBar),
        Paint()
          ..color = _getColorLife(currentBarLife)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  void _drawStamina(Canvas canvas) {
    double xBar = position.left + 26;
    double yBar = position.top + 28;

    double currentBarStamina = (stamina * widthBar) / maxStamina;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarStamina, yBar),
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  Color _getColorLife(double currentBarLife) {
    if (currentBarLife > widthBar - (widthBar / 3)) {
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}

class RoboZZleFunctionComponent extends InterfaceComponent {
  final ValueChanged<bool>? onTapComponent;
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;
  final List<Map<String, dynamic>> functions = [
    {
      "F1": [
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
      ],
      'rect': null,
      'selected': false,
    },
  ];

  RoboZZleFunctionComponent({
    Vector2? position,
    int? id,
    this.onTapComponent,
  }) : super(
          id: id ?? 1,
          position: position ?? Vector2(20, 20),
          width: 200,
          height: 250,
        );

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void onTapDown(int pointer, Offset position) {
    for (int indexRow = 0; indexRow < functions.length; indexRow++) {
      Map<String, dynamic> function = functions.elementAt(indexRow);
      Rect rect = function['rect'];
      if (rect.left < position.dx &&
          rect.right > position.dx &&
          position.dy < rect.bottom)
        functions[indexRow]['selected'] = true;
      else
        functions[indexRow]['selected'] = false;
    }
    super.onTapDown(pointer, position);
  }

  @override
  void render(Canvas c) {
    try {
      _drawLife(c);
      _drawStamina(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawLife(Canvas canvas) {
    String text;
    double? _measuredWidth;
    double? _measuredHeight;
    Vector2Rect textPosition = position;

    for (int indexRow = 0; indexRow < functions.length; indexRow++) {
      Map<String, dynamic> function = functions.elementAt(indexRow);
      Color funcColor = getFuncColor(function.keys.first)!;
      final TextPaint textConfig =
          TextPaint(config: TextPaintConfig(color: funcColor));

      text = function.keys.first;
      if (_measuredWidth == null) {
        _measuredWidth = textConfig.measureTextWidth(text);
        _measuredHeight = textConfig.measureTextHeight(text);
        textPosition = position.copyWith(
          size: Vector2(_measuredWidth, _measuredHeight),
        );
      }

      textConfig.render(
        canvas,
        text,
        Vector2(15 + (indexRow) * 50, 15),
      );
      for (int indexCol = 0;
          indexCol < function.values.first.length;
          indexCol++) {
        Rect rect = Rect.fromLTWH((indexRow + 0.25) * 50,
            15 + (indexCol + 1) * 40, mapTileSize, mapTileSize);
        functions[indexRow]['rect'] = rect;
        Paint paintHover = new Paint()
          ..color = funcColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = functions[indexRow]['selected'] == true ? 2.5 : 1;
        canvas.drawRect(rect, paintHover);
      }
    }
  }

  void _drawStamina(Canvas canvas) {}

  void addNewFunction() {
    if (functions.length >= 4) return;
    functions.add({
      'F${functions.length + 1}': [
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
        PlayerActionType.RoboZZleEmpty,
      ],
      'rect': null,
      'selected': false,
    });
  }

  Color? getFuncColor(String name) {
    switch (name) {
      default:
        return Colors.black;
    }
  }
}
