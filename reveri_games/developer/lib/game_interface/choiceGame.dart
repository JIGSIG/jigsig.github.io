import 'package:audio_session/audio_session.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:bonfire/bonfire.dart';
import 'package:developer/Sound/sound.dart';
import 'package:developer/intro/intro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceGame extends StatefulWidget {
  ChoiceGameChecker createState() => ChoiceGameChecker();
}

class ChoiceGameChecker extends State<ChoiceGame> {
  @override
  void initState() {
    if (!kIsWeb) {
      Flame.device.setLandscape();
      Flame.device.fullScreen();
    }
    super.initState();
  }

  bool _seen = false;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      return Splash();
    } else {
      await prefs.setBool('seen', true);
      return ChoiceGameChecker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _seen ? Splash() : ChoiceGameWidget();
          }
        });
  }
}

class ChoiceGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ProgressHudState> _hudKey = GlobalKey();
    var submitTextStyle = GoogleFonts.nunito(
        fontSize: MediaQuery.of(context).size.width < 900 ? 15 : 28,
        letterSpacing: 5,
        color: Colors.white,
        fontWeight: FontWeight.w300);
    return Scaffold(
      body: ProgressHud(
        key: _hudKey,
        maximumDismissDuration: Duration(seconds: 2),
        child: Center(
          child: Builder(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: AnimatedButton(
                      onPress: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.75,
                      text: "Lancez la partie",
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TOP_ROUNDER,
                      textStyle: submitTextStyle,
                      backgroundColor: Colors.lightBlue,
                      selectedBackgroundColor: Colors.lightGreen,
                      borderColor: Colors.white,
                      borderWidth: 1,
                      borderRadius: 50,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
//     var submitTextStyle = GoogleFonts.ubuntu(
//         fontSize: MediaQuery.of(context).size.width < 800 ? 12 : 20,
//         letterSpacing: MediaQuery.of(context).size.width < 800 ? 2 : 5,
//         color: Colors.black,
//         fontWeight: FontWeight.w300);
//     return Scaffold(
// //      backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             image: new DecorationImage(
//                               image: new AssetImage("assets/images/back.png"),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           width: MediaQuery.of(context).size.width < 950
//                               ? MediaQuery.of(context).size.width
//                               : MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height,
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   height:
//                                       MediaQuery.of(context).size.height / 4,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Padding(
//                                           padding: EdgeInsets.only(left: 30),
//                                           // padding: EdgeInsets.only(
//                                           //     left: MediaQuery.of(context)
//                                           //                 .size
//                                           //                 .width >
//                                           //             850
//                                           //         ? 170
//                                           //         : 90),
//                                           child: Text(
//                                             '{Dévéloppeur}',
//                                             style: GoogleFonts.lato(
//                                               textStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 letterSpacing: .5,
//                                                 fontSize: MediaQuery.of(context)
//                                                             .size
//                                                             .width >
//                                                         800
//                                                     ? 45
//                                                     : 10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   height:
//                                       MediaQuery.of(context).size.height / 2,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         child: Container(
//                                           padding: EdgeInsets.only(left: 90),
//                                           child: AnimatedButton(
//                                             onPress: () {
//                                               // SoundGlobal().themeEntrance();
//                                               Navigator.of(context)
//                                                   .push(_createRoute());
//                                             },
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 10,
//                                             width: MediaQuery.of(context)
//                                                         .size
//                                                         .width <
//                                                     820
//                                                 ? 150
//                                                 : MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     3.2,
//                                             text: MediaQuery.of(context)
//                                                         .size
//                                                         .width >
//                                                     850
//                                                 ? 'Commencez votre Aventure'
//                                                 : 'Commencez',
//                                             isReverse: true,
//                                             selectedTextColor: Colors.black,
//                                             transitionType:
//                                                 TransitionType.LEFT_TO_RIGHT,
//                                             textStyle: submitTextStyle,
//                                             backgroundColor: Colors.white,
//                                             borderColor: Colors.black,
//                                             borderRadius: 50,
//                                             borderWidth: 2,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Container(
//                                           padding: EdgeInsets.only(left: 90),
//                                           child: AnimatedButton(
//                                             onPress: () {
//                                               Navigator.of(context)
//                                                   .push(_createRoute());
//                                             },
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 10,
//                                             width: MediaQuery.of(context)
//                                                         .size
//                                                         .width <
//                                                     820
//                                                 ? 150
//                                                 : MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     3.2,
//                                             text: MediaQuery.of(context)
//                                                         .size
//                                                         .width >
//                                                     850
//                                                 ? 'Commencez votre Aventure'
//                                                 : 'Commencez',
//                                             isReverse: true,
//                                             selectedTextColor: Colors.black,
//                                             transitionType:
//                                                 TransitionType.LEFT_TO_RIGHT,
//                                             textStyle: submitTextStyle,
//                                             backgroundColor: Colors.blueAccent,
//                                             borderColor: Colors.white,
//                                             borderRadius: 50,
//                                             borderWidth: 2,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     height:
//                                         MediaQuery.of(context).size.height / 4,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.zero,
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(right: 30),
//                                           child: Text(
//                                             'Chef de Projet Digital',
//                                             style: GoogleFonts.lato(
//                                               textStyle: TextStyle(
//                                                 color: Colors.white,
//                                                 letterSpacing: .5,
//                                                 fontSize: MediaQuery.of(context)
//                                                             .size
//                                                             .width >
//                                                         800
//                                                     ? 45
//                                                     : 5,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//    );
  }

  Future<void> _init() async {
    final _player = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _player.setAsset("images/music/venus.mp3");
      await _player.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ReverieIntro(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}

Widget AccessScreen(BuildContext context) {
  GlobalKey<ProgressHudState> _hudKey = GlobalKey();
  var submitTextStyle = GoogleFonts.nunito(
      fontSize: MediaQuery.of(context).size.width < 900 ? 15 : 28,
      letterSpacing: 5,
      color: Colors.white,
      fontWeight: FontWeight.w300);
  return Scaffold(
    body: ProgressHud(
      key: _hudKey,
      maximumDismissDuration: Duration(seconds: 2),
      child: Center(
        child: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/laptop-icons/access.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Code d'accès",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.code,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  onPress: () {},
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.75,
                  text: "Rentrez vos codes d'accès",
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  textStyle: submitTextStyle,
                  backgroundColor: Colors.lightBlue,
                  selectedBackgroundColor: Colors.lightGreen,
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: 50,
                ),
              ],
            ),
          );
        }),
      ),
    ),
  );
}
