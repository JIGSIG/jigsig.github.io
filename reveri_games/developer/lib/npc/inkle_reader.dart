import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InkleReader {
  final String path;
  late final DialogTree dialogTree;

  InkleReader({required this.path}) {
    getFileLines().then((value) {
      String jsonString = value;
      Map<String, dynamic> inkleContent = json.decode(jsonString);
      dialogTree = new DialogTree(inkleContent, path: path);
    });
  }

  Future<String> getFileLines() async {
    String fileText = await rootBundle.loadString(path);
    return fileText;
  }
}

class DialogTree {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final List<DialogStich> stiches;
  late final String initial;
  late final String aiKey;
  late String? playPoint;

  DialogTree(final Map<String, dynamic> inkleContent, {required String path}) {
    stiches = List.generate(inkleContent["data"]["stitches"].length, (index) {
      return DialogStich(
          stich: (inkleContent["data"]["stitches"] as Map<String, dynamic>)
              .values
              .elementAt(index),
          id: inkleContent["data"]["stitches"].keys.elementAt(index));
    });
    initial = inkleContent["data"]["initial"];
    _prefs.then((value) {
      SharedPreferences preferences = value;
      playPoint = preferences.getString("playPoint-$path") ?? initial;
    });
    aiKey = inkleContent["url_key"].toString();
  }
}

class DialogStich {
  final String id;
  late final String content;
  late final List<DialogOption> options;
  late bool end;

  DialogStich({required final Map<String, dynamic> stich, required this.id}) {
    end = false;
    List objects = stich["content"];
    content = objects[0];
    options = [];
    objects.forEach((element) {
      if (element.runtimeType != String) {
        Map<String, dynamic> object = element;
        if (object.keys.contains("divert")) {
          options.add(DialogOption.fromJson(object, divert: true));
        } else if (object.keys.contains("option")) {
          options.add(DialogOption.fromJson(object));
        }
      }
    });
  }
}

class DialogOption {
  final String? choice;
  final String? linkPath;
  final dynamic ifConditions;
  final dynamic notIfConditions;
  final bool divert;

  DialogOption({
    required this.choice,
    required this.linkPath,
    this.ifConditions,
    this.notIfConditions,
    this.divert = false,
  });

  static DialogOption fromJson(Map<String, dynamic> object,
      {final bool divert = false}) {
    if (divert)
      return DialogOption(
        choice: null,
        linkPath: object['divert'],
        divert: true,
      );
    return DialogOption(
      choice: object['option'],
      linkPath: object['linkPath'],
      ifConditions: object['ifConditions'],
      notIfConditions: object['notIfConditions'],
    );
  }
}
