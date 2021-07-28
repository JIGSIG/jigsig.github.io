import 'package:bonfire/bonfire.dart';

class JoueurInterface extends GameInterface {
  @override
  Future<void> onLoad() {
    /*
    add(BarLifeComponent());
    add(InterfaceComponent(
      sprite: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      height: 40,
      width: 40,
      id: 5,
      position: Vector2(150, 20),
      onTapComponent: (selected) {
        if (gameRef.player != null) {
          (gameRef.player as Knight).showEmote();
        }
      },
    ));
    */
    return super.onLoad();
  }
}
