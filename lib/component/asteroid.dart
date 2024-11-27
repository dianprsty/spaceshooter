import 'dart:async';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  double asteroidSize = 0.5;

  Asteroid({required this.asteroidSize}) {
    scale = Vector2(asteroidSize, asteroidSize);
  }
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");
    anchor = Anchor.center;
  }
}
