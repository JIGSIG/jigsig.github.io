import 'package:bonfire/collision/collision_area.dart';

class IsometricDataObjectCollision {
  final List<CollisionArea>? collisions;
  final String type;
  final Map<String, dynamic>? properties;

  IsometricDataObjectCollision(
      {this.collisions, this.type = '', this.properties});
}
