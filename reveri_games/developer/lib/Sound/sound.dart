import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

class SoundGlobal {
  var _themeEntrance = new AudioPlayer();

  final _elevator = new AudioPlayer();

  final _reception = new AudioPlayer();

  void themeEntrance() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _themeEntrance.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _themeEntrance.setAsset("images/music/Theme.mp3");
      await _themeEntrance.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void elevator() async {
    _themeEntrance.stop();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _elevator.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _elevator.setAsset("images/music/GoodNight.mp3");
      await _elevator.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void Reception() async {
    _themeEntrance.stop();
    _elevator.stop();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _reception.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _reception.setAsset("images/music/Good Night.mp3");
      await _reception.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void StopAll() {
    _themeEntrance.stop();
    _elevator.stop();
    _reception.stop();
  }
}
