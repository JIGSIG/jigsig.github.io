import 'dart:convert';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';

Future<String> loadAsset(asset) async {
  return await rootBundle.loadString(asset);
}

Future<Vector2> findPlayerLocation(
    {required String map, bool isElevator = true}) async {
  Vector2 position = Vector2(0, 0);
  final contents = await loadAsset(map);
  Map<String, dynamic> data = json.decode(contents);
  final List layers = data['layers'];
  final List objetGroups = layers.where((layer) {
    return layer['type'] == 'objectgroup';
  }).toList();
  String location = isElevator ? "teleportation" : "entry";
  var locationInGame;
  for (dynamic objectGroup in objetGroups) {
    final List objects = objectGroup['objects'];
    objects.forEach((object) {
      if (object['name'] == location) locationInGame = object;
    });
  }
  print(locationInGame);
  position.x = locationInGame['x'] * 2;
  position.y = locationInGame['y'] * 2;
  return position;
}
