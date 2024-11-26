import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class SpaceShooterGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(SpriteComponent(
      sprite: await loadSprite('ships/spaceShips_001.png'),
    ));
  }
}
