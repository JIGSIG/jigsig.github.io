import 'dart:convert';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
  final goodLayer = layers.firstWhere((layer) {
    final List objects = layer['objects'] ?? [];
    return layer['type'] == 'objectgroup' &&
        objects.firstWhere((object) => object['name'] == location) !=
            null;
  });
  final List objects = goodLayer['objects'];
  final goodObject =
      objects.firstWhere((element) => element['name'] == location);
  position.x = goodObject['x'] * 2;
  position.y = goodObject['y'] * 2;
  print(position);
  return position;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
