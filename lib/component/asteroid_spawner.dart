import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:spaceshooter/component/asteroid.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;

  @override
  FutureOr<void> onLoad() {
    double margin = 10;
    Random random = Random();
    spawner = SpawnComponent(
      factory: (amount) {
        return Asteroid(asteroidSize: random.nextDouble() * 0.1 + 0.1);
      },
      period: 1,
      autoStart: true,
      area: Rectangle.fromLTWH(
          margin, margin, game.size.x - 2 * margin, game.size.y - 2 * margin),
      within: false,
    );

    game.add(spawner);
    return super.onLoad();
  }
}
