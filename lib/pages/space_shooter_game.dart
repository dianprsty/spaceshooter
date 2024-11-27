import 'dart:async';
import 'dart:developer';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:spaceshooter/component/ship.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late Ship ship;
  @override
  FutureOr<void> onLoad() async {
    ship = Ship();
    add(ship);
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   log("Tap Down Event ${event.localPosition}");
  //   ship.position.add(Vector2(10, 0));
  // }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    ship.setEndPoint(info);
    // ship.position = info.eventPosition.global;
  }
}
