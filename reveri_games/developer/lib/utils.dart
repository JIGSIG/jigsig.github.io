import 'dart:convert';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> loadAsset(asset) async {
  return await rootBundle.loadString(asset);
}

Future<Vector2> findPlayerLocation(
    {required String map,
    required BuildContext context,
    bool isElevator = true}) async {
  try {
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
    print("kIsWeb: $kIsWeb");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double ratio = 1;
    if (height >= width) {
      ratio = height / width * (kIsWeb ? 2.1 : 1);
    } else {
      ratio = width / height * (kIsWeb ? 2.1 : 1);
    }
    print("ratio: $ratio");
    position.x = locationInGame['x'] * ratio;
    position.y = locationInGame['y'] * ratio;
    return position;
  } catch (err) {
    print(err);
    return Vector2(0, 0);
  }
}
