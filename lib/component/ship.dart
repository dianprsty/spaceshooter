import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/rendering.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/component/bullet.dart';
import 'package:spaceshooter/component/explosion.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';

class Ship extends SpriteComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  late Vector2 endPoint;
  late Vector2 direction;
  double speed = 3;
  bool isShooting = false;
  bool isBeeingHit = false;
  double hitTimer = 0;
  double hitCooldown = 20;
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
      isShooting = true;
      FlameAudio.play("GUNArtl_Grenade Launcher Fire_05.wav");
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
    add(
      CircleHitbox(
        radius: (sprite!.image.width * 0.7) / 2,
        collisionType: CollisionType.active,
      ),
    );
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

    if (isBeeingHit) {
      hitTimer++;
      if (hitTimer > hitCooldown) {
        isBeeingHit = false;
        hitTimer = 0;
        decorator.removeLast();
        decorator.removeLast();
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (!isBeeingHit && other is! Bullet) {
      isBeeingHit = true;
      decorator
          .addLast(PaintDecorator.tint(const Color.fromARGB(2552, 255, 0, 0)));
      decorator.addLast(PaintDecorator.blur(10));
      game.looseLive();
      game.add(Explosion(intersectionPoints.first, Vector2(0.4, 0.4)));
      FlameAudio.play("EXPLDsgn_Explosion Impact_14.wav");
    }
    super.onCollision(intersectionPoints, other);
  }
}
