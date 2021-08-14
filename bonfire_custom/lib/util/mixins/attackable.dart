import 'package:bonfire/base/game_component.dart';
import 'package:bonfire/collision/object_collision.dart';
import 'package:bonfire/util/vector2rect.dart';

import '../../objects/animated_object.dart';
import '../direction.dart';

enum ReceivesAttackFromEnum { ALL, NPC, PLAYER }
enum AttackFromEnum { NPC, PLAYER }

mixin Attackable on GameComponent {
  /// Used to define which type of component can be damaged
  ReceivesAttackFromEnum receivesAttackFrom = ReceivesAttackFromEnum.ALL;

  void receiveDamage(double damage, dynamic from);

  void receiveInteraction(interactionType type, dynamic from,
      {Direction? direction, List? options});

  Vector2Rect rectAttackable() => this.isObjectCollision()
      ? (this as ObjectCollision).rectCollision
      : position;

  bool receivesAttackFromPlayer() {
    return receivesAttackFrom == ReceivesAttackFromEnum.ALL ||
        receivesAttackFrom == ReceivesAttackFromEnum.PLAYER;
  }

  bool receivesAttackFromNpc() {
    return receivesAttackFrom == ReceivesAttackFromEnum.ALL ||
        receivesAttackFrom == ReceivesAttackFromEnum.NPC;
  }
}
