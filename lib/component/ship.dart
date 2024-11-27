import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 200);
    angle = pi * 1.5;
    // size = Vector2(50, 50);
    // scale = Vector2(1.5, 1.5);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    // position.add(Vector2(5, 2));
    // if (position.x > 500) {
    //   position.x = 0;
    // }

    // if (position.y > 800) {
    //   position.y = 0;
    // }
    super.update(dt);
  }
}
