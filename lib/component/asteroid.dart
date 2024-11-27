import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  double asteroidSize = 0.5;
  late Vector2 direction;
  late double speed;

  Asteroid({required this.asteroidSize}) {
    scale = Vector2(asteroidSize, asteroidSize);
  }
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");
    anchor = Anchor.center;

    Random random = Random();

    double x = random.nextDouble() * 2 - 1;
    double y = random.nextDouble() * 2 - 1;

    direction = Vector2(x, y);

    speed = random.nextDouble() * 50;
  }

  @override
  void update(double dt) {
    position.add(direction * speed * dt);

    if (position.x < 0 ||
        position.x > game.size.x ||
        position.y < 0 ||
        position.y > game.size.y) {
      removeFromParent();
    }
    super.update(dt);
  }
}
