import 'dart:async';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");
    anchor = Anchor.center;
    scale = Vector2(0.5, 0.5);
    position = Vector2(game.size.x / 2, game.size.y / 2);
  }
}
