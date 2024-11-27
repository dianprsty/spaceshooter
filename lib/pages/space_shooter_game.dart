import 'dart:async';
import 'package:flame/game.dart';
import 'package:spaceshooter/component/ship.dart';

class SpaceShooterGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    Ship ship = Ship();
    add(ship);
  }
}
