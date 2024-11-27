import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Bullet extends SpriteComponent with HasGameRef {
  TapDownInfo info;
  late Vector2 direction;
  double speed = 500;
  double timeToLive = 1000;

  Bullet(position, this.info) : super(position: position) {
    direction = info.eventPosition.global - position;
    direction = direction.normalized();
    priority = 1;
    lookAt(info.eventPosition.global);
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("bullets/spaceMissiles_018.png");
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    timeToLive--;
    if (timeToLive < 0) {
      removeFromParent();
    }
    position.add(direction * speed * dt);
    super.update(dt);
  }
}
