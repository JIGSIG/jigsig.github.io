import 'package:bonfire/bonfire.dart';
import 'package:developer/Quests/Quest1.dart';
import 'package:developer/main.dart';
import 'package:developer/npc/inkle_reader.dart';
import 'package:developer/util/admin-employees_sprite_sheet/admin-employee4-sprite-sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/common_sprite_sheet.dart';

class AdminEmployee4NPC extends SimpleNPC with ObjectCollision {
  double attack = 20;
  bool _seePlayerClose = false;
  bool interactionAsked = false;
  bool isInteracting = false;
  bool waitingForPlayerToRespond = false;
  late final InkleReader _inkleReader;
  final String? dialogFilename;
  static bool discussionDone = false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late final SharedPreferences preferences;

  AdminEmployee4NPC(Vector2 position, {this.dialogFilename})
      : super(
          animation: AdminEmployee4SpriteSheet.simpleDirectionAnimation,
          position: position,
          width: mapTileSize * 1.2,
          height: mapTileSize * 1.8,
          speed: mapTileSize * 1.6,
          initDirection: Direction.up,
          life: 100,
        ) {
    _prefs.then((value) {
      preferences = value;
    });

    _inkleReader = InkleReader(path: 'assets/ai_dialogs/$dialogFilename');
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(
              mapTileSize,
              mapTileSize,
            ),
            align: Vector2(
              mapTileSize * 0.15,
              mapTileSize,
            ),
          ),
        ],
      ),
    );
    setupMoveToPositionAlongThePath(
      pathLineColor: Colors.transparent,
      barriersCalculatedColor: Colors.blue.withOpacity(0.5),
      pathLineStrokeWidth: 4,
      showBarriersCalculated: false,
      // uses this to debug. This enable show in
      // the map the tiles considered collision by algorithm.
      tileSizeIsSizeCollision: false,
    );
  }

  @override
  void update(double dt) {
    QuestPage1();
    if (discussionDone == false)
      thomasAsKey();
    else {
      keyMarkerDisable();
    }
    super.update(dt);
    return;
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
      ),
    );
    remove();
    super.die();
  }

  void askToPlayer(List options) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    this.simpleInteractionInChat(id: this, options: options);
  }

  void endInteractionWithPlayer() {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    this.endInteraction(id: this);
    gameRef.camera.moveToPlayerAnimated();
    isInteracting = false;
    print("endInteractionWithPlayer");
    preferences.setString("playPoint-assets/ai_dialogs/$dialogFilename",
        _inkleReader.dialogTree.playPoint!);
  }

  void thomasAsKey() async {
    preferences.setBool("ThomasAndre", true);
  }

  void keyMarkerDisable() async {
    preferences.setBool("ThomasAndre", false);
  }

  void showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emoteExclamation,
        target: this,
        positionFromTarget: Rect.fromLTWH(
          18,
          -6,
          width / 2,
          height / 2,
        ).toVector2Rect(),
      ),
    );
  }

  void _showTalk() {
    DialogStich? getCurrent() {
      for (DialogStich stich in _inkleReader.dialogTree.stiches) {
        if (stich.id == _inkleReader.dialogTree.playPoint) return stich;
      }
      return null;
    }

    DialogStich? current = getCurrent();
    gameRef.camera.moveToTargetAnimated(
      this,
      zoom: 2,
      finish: () async {
        while (true) {
          String? choice;
          DialogItemType getType() {
            if (current!.options.length == 1 && current!.options.first.divert)
              return DialogItemType.SIMPLETEXT;
            return DialogItemType.INTERACTIVETEXT;
          }

          DialogItemType type = getType();
          choice = await TalkDialog.show(
              gameRef.context,
              [
                DialogItem(
                  text: current!.content,
                  person: Container(
                    width: 100,
                    height: 100,
                    child: FutureBuilder<SpriteAnimation>(
                      future: AdminEmployee4SpriteSheet.idleDown,
                      builder: (context, anim) {
                        if (!anim.hasData) return SizedBox.shrink();
                        return SpriteAnimationWidget(
                          animation: anim.data!,
                          playing: true,
                        );
                      },
                    ),
                  ),
                  dialogItemType: type,
                  choices: List.generate(
                    current!.options.length,
                    (index) => current!.options.elementAt(index).choice ?? '',
                  ),
                ),
              ],
              finish: () {},
              logicalKeyboardKeyToNext: LogicalKeyboardKey.space,
              backgroundColor: Colors.black.withOpacity(.5));
          current = getNextDialog(choice: choice, current: current);
          if (current == null) {
            if (choice != null) discussionDone = true;
            break;
          }
        }
        endInteractionWithPlayer();
      },
    );
  }

  @override
  void receiveInteraction(interactionType type, from,
      {Direction? direction, List? options}) {
    if (!isInteracting) {
      showEmote();
      isInteracting = true;
      if (type == interactionType.STARTCHAT) {
        print("startDialogWithPlayer");
        interactionAsked = true;
        _showTalk();
      }
    }
    super.receiveInteraction(type, from, direction: direction);
  }

  @override
  void actionAtDestination() {
    die();
    super.actionAtDestination();
  }

  DialogStich? getNextDialog({String? choice, DialogStich? current}) {
    if (current == null) return null;
    DialogOption? getOption() {
      for (DialogOption option in current.options) {
        if (option.choice == choice) return option;
      }
      return null;
    }

    DialogStich? getNext(String? linkPath) {
      for (DialogStich stich in _inkleReader.dialogTree.stiches) {
        if (stich.id == linkPath) return stich;
      }
      return null;
    }

    final DialogOption? dialogOption = getOption();
    DialogStich? next = getNext(dialogOption?.linkPath);
    _inkleReader.dialogTree.playPoint =
        dialogOption?.linkPath ?? _inkleReader.dialogTree.playPoint;
    return next;
  }
}
