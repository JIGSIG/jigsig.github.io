import 'package:bonfire/bonfire.dart';

import 'bar_life_component.dart';

class JoueurRoboZZleInterface extends GameInterface {
  @override
  Future<void> onLoad() {
    var id = new DateTime.now().millisecondsSinceEpoch;
    RoboZZleFunctionComponent functionComponent = RoboZZleFunctionComponent(
      onTapComponent: (value) {},
      id: id,
      position: Vector2(
        20,
        20.0,
      ),
    );
    add(functionComponent);
    add(InterfaceComponent(
      sprite: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      height: 40,
      width: 40,
      id: 404,
      position: Vector2(20, gameRef.size.y - 60),
      onTapComponent: (selected) {
        if (gameRef.interface!.interfaceComponents.length >= 10) return;
        print(gameRef.interface!.interfaceComponents.length);
        Vector2 currentPos = gameRef.player!.position.position;
        Vector2 nextPos = Vector2(currentPos.x, currentPos.y);
        gameRef.player!.moveTo(nextPos);
        //functionComponent.addNewFunction();
      },
    ));
    return super.onLoad();
  }
}
