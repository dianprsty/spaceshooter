import 'dart:async';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/component/asteroid_spawner.dart';
import 'package:spaceshooter/component/bg_parallax.dart';
import 'package:spaceshooter/component/ship.dart';

class SpaceShooterGame extends FlameGame with PanDetector, TapDetector {
  late Ship ship;
  late BgParallax bgParallax;
  late AsteroidSpawner asteroidSpawner;
  @override
  FutureOr<void> onLoad() async {
    bgParallax = BgParallax();
    add(bgParallax);

    ship = Ship();
    add(ship);

    asteroidSpawner = AsteroidSpawner();
    add(asteroidSpawner);
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000030);
  }

  @override
  void update(double dt) {
    if (ship.position == ship.endPoint) {
      bgParallax.changeSpeed(Vector2(2, 2));
    } else {
      bgParallax.changeSpeedBasedOnShip(ship);
    }
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    ship.setEndPoint(info);
  }

  @override
  void onTapDown(TapDownInfo info) {
    ship.shoot(info);
    super.onTapDown(info);
  }
}
