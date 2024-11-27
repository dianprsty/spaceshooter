import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:spaceshooter/component/bullet.dart';

class Ship extends SpriteComponent with HasGameRef, CollisionCallbacks {
  late Vector2 endPoint;
  late Vector2 direction;
  double speed = 3;
  bool isShooting = false;
  double shootCooldown = 20;
  double shootTimer = 0;

  Ship() {
    endPoint = position;
    direction = Vector2(0, 0);
    priority = 2;
  }

  void setEndPoint(DragUpdateInfo info) {
    endPoint = info.eventPosition.global;
    lookAt(endPoint);
    angle += pi;
    direction = endPoint - position;
    direction = direction.normalized();
  }

  void shoot(TapDownInfo info) {
    if (!isShooting) {
      Bullet bullet = Bullet(position, info);
      game.add(bullet);
    }
    isShooting = true;
    lookAt(info.eventPosition.global);
    angle += pi;
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 200);
    angle = pi * 1.5;
    // size = Vector2(50, 50);
    scale = Vector2(0.7, 0.7);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if (isShooting) {
      shootTimer++;
      if (shootTimer > shootCooldown) {
        isShooting = false;
        shootTimer = 0;
      }
    }
    if ((endPoint - position).length < speed) {
      position = endPoint;
      direction = Vector2(0, 0);
    }
    position.add(direction * speed);
    if (position.x < 0) position.x = game.size.x;
    if (position.x > game.size.x) position.x = 0;
    if (position.y < 0) position.y = game.size.y;
    if (position.y > game.size.y) position.y = 0;
    super.update(dt);
  }
}
