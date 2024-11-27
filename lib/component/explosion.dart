import 'dart:async';

import 'package:flame/components.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef {
  double timeToLive = 0.7;
  Explosion(position, scale) : super(position: position, scale: scale);
  @override
  FutureOr<void> onLoad() async {
    List<Sprite> listImage = [
      await game.loadSprite("explosion/explosion3.png"),
      await game.loadSprite("explosion/explosion2.png"),
      await game.loadSprite("explosion/explosion1.png"),
      await game.loadSprite("explosion/explosion2.png"),
      await game.loadSprite("explosion/explosion3.png"),
    ];

    animation = SpriteAnimation.spriteList(listImage, stepTime: 0.15);
    anchor = Anchor.center;
    priority = 3;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    timeToLive -= 1 / 60;
    if (timeToLive < 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}
