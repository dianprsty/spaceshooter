import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  late Vector2 endPoint;
  late Vector2 direction;
  double speed = 3;

  Ship() {
    endPoint = position;
    direction = Vector2(0, 0);
  }

  void setEndPoint(DragUpdateInfo info) {
    endPoint = info.eventPosition.global;
    lookAt(endPoint);
    angle += pi;
    direction = endPoint - position;
    direction = direction.normalized();
  }

  @override
  void onMount() {
    super.onMount();
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
    if ((endPoint - position).length < speed) {
      position = endPoint;
      direction = Vector2(0, 0);
    }
    position.add(direction * speed);
    super.update(dt);
  }
}
