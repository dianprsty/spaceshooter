import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:spaceshooter/component/blast_particle.dart';
import 'package:spaceshooter/component/bullet.dart';
import 'package:spaceshooter/component/ship.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';

class Asteroid extends SpriteComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  double asteroidSize = 0.5;
  late Vector2 direction;
  late double speed;

  Asteroid({required this.asteroidSize}) {
    scale = Vector2(asteroidSize, asteroidSize);
  }
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("meteor/sinbe.png");
    anchor = Anchor.center;
    add(RectangleHitbox(collisionType: CollisionType.passive));

    Random random = Random();

    double x = random.nextDouble() * 2 - 1;
    double y = random.nextDouble() * 2 - 1;

    direction = Vector2(x, y);

    speed = 150;
  }

  @override
  void update(double dt) {
    position.add(direction * speed * dt);

    if (position.x < -size.x / 2 ||
        position.x > game.size.x + size.x / 2 ||
        position.y < -size.y / 2 ||
        position.y > game.size.y + size.y / 2) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bullet || other is Ship) {
      game.add(BlastParticle(particlePosition: position, radius: asteroidSize));
      game.addScore(10);
      FlameAudio.play("EXPLDsgn_Explosion Impact_14.wav");
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }
}
