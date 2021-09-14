import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:developer/player/joueur.dart';
import 'package:flutter/material.dart';

class QuestInterfaceComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;
  double maxStamina = 100;
  double stamina = 0;

  QuestInterfaceComponent({Vector2? position, int? id})
      : super(
          id: id ?? 1,
          position: position ?? Vector2(20, 20),
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
    Rect rect = Rect.fromLTWH(0, 0, 200, 100);
    Paint paintHover = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRect(rect, paintHover);
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

class JoueurQuestInterface extends GameInterface {
  @override
  Future<void> onLoad() {
    double x = MediaQuery.of(gameRef.context).size.width * .01;
    double y = MediaQuery.of(gameRef.context).size.height / 4;
    QuestInterfaceComponent functionComponent = QuestInterfaceComponent(
      id: 1,
      position: Vector2(
        x,
        y,
      ),
    );
    //add(functionComponent);
    return super.onLoad();
  }
}
