import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/component/asteroid.dart';
import 'package:spaceshooter/component/bg_parallax.dart';
import 'package:spaceshooter/component/ship.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late Ship ship;
  late BgParallax bgParallax;
  late Asteroid asteroid;
  @override
  FutureOr<void> onLoad() async {
    bgParallax = BgParallax();
    add(bgParallax);

    asteroid = Asteroid();
    add(asteroid);

    ship = Ship();
    add(ship);
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000030);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedOnShip(ship);
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    ship.setEndPoint(info);
    // ship.position = info.eventPosition.global;
  }
}
