import 'dart:async';
import 'dart:ui';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/component/asteroid_spawner.dart';
import 'package:spaceshooter/component/bg_parallax.dart';
import 'package:spaceshooter/component/ship.dart';
import 'package:spaceshooter/ui/game_data.dart';
import 'package:spaceshooter/ui/live_ui.dart';
import 'package:spaceshooter/ui/score_text.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, TapDetector, HasCollisionDetection {
  late Ship ship;
  late BgParallax bgParallax;
  late AsteroidSpawner asteroidSpawner;
  late GameData data;
  late ScoreText scoreText;
  late LiveUi liveUI;

  @override
  FutureOr<void> onLoad() async {
    data = GameData(0, 3);
    bgParallax = BgParallax();
    add(bgParallax);

    ship = Ship();
    add(ship);

    asteroidSpawner = AsteroidSpawner();
    add(asteroidSpawner);

    scoreText = ScoreText(data);
    add(scoreText);

    liveUI = LiveUi(data);
    add(liveUI);
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

  void addScore(int score) {
    data.addScore(score);
  }

  void looseLive() {
    data.loseLive();
    liveUI.looseLive();
    if (data.live <= 0) {
      // game over
    }
  }
}
