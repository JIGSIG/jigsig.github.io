import 'package:bonfire/bonfire.dart';
import 'package:bonfire/map/map_world.dart';

class IsometricWorldData {
  final MapWorld map;
  final List<GameComponent>? components;

  IsometricWorldData({required this.map, this.components});
}
