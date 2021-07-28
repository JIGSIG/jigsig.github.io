import 'package:bonfire/bonfire.dart';
import 'package:digital_project_manager/main.dart';
import 'package:digital_project_manager/npc/inkle_reader.dart';
import 'package:digital_project_manager/util/back_web_dev_sprite_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/common_sprite_sheet.dart';

class BackEndDevNPC extends SimpleNPC with ObjectCollision {
  double attack = 20;
  bool _seePlayerClose = false;
  bool interactionAsked = false;
  bool isInteracting = false;
  bool waitingForPlayerToRespond = false;
  late final InkleReader _inkleReader;
  final String? dialogFilename;

  BackEndDevNPC(Vector2 position, {this.dialogFilename})
      : super(
          animation: BackEndDevSpriteSheet.simpleDirectionAnimation,
          position: position,
          width: mapTileSize * 1,
          height: mapTileSize * 1.5,
          speed: mapTileSize * 1.6,
          initDirection: Direction.right,
          life: 100,
        ) {
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
      pathLineColor: Colors.lightBlueAccent.withOpacity(0.5),
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
    super.update(dt);
    return;
    if (this.isDead) return;
    _seePlayerClose = false;
    this.seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        if (interactionAsked) return null;
        this.seeAndMoveToPlayer(
            closePlayer: (player) {
              if (!interactionAsked) {
                askToPlayer([]);
              }
            },
            radiusVision: mapTileSize * 1000,
            runOnlyVisibleInScreen: false);
      },
      radiusVision: mapTileSize * 1000,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //this.drawDefaultLifeBar(canvas);
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

  void endDialogWithPlayer() {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    this.simpleEndChat(id: this);
    gameRef.camera.moveToPlayerAnimated();
    isInteracting = false;
    print("endDialogWithPlayer");
    Future.delayed(Duration(seconds: 1), () => moveTo(Vector2(40.62, 842.97)));
  }

  void showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emote,
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
          if (current == null) break;
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
                      future: BackEndDevSpriteSheet.idleDown,
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
        }
        endDialogWithPlayer();
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

  @override
  void receiveDamage(double damage, dynamic from) {
    super.receiveDamage(0, from);
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
