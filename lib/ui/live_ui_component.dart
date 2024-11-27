import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

class LiveUiComponent extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("ships/spaceShips_001.png");
    anchor = Anchor.center;
    scale = Vector2(0.3, 0.3);
    angle = pi;
    return super.onLoad();
  }
}
