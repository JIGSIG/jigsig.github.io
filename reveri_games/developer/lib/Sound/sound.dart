import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundGlobal extends StatefulWidget {
  SoundGlobal({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SoundGlobalState createState() => _SoundGlobalState();
}

class _SoundGlobalState extends State<SoundGlobal> {
  String json = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Text(json),
      ),
    );
  }
}

Future<void> onLoad() async {
  Future.delayed(const Duration(milliseconds: 1000), () async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("images/music/venus.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  });
}
