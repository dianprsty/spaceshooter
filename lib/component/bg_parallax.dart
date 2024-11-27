import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:spaceshooter/component/ship.dart';

class BgParallax extends ParallaxComponent with HasGameRef {
  final _parllelImages = [
    ParallaxImageData("parallax/bkgd_0.png"),
    ParallaxImageData("parallax/bkgd_1.png"),
    ParallaxImageData("parallax/bkgd_2.png"),
    ParallaxImageData("parallax/bkgd_3.png"),
    ParallaxImageData("parallax/bkgd_4.png"),
    ParallaxImageData("parallax/bkgd_5.png"),
    ParallaxImageData("parallax/bkgd_6.png"),
  ];

  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      _parllelImages,
      baseVelocity: Vector2(4, -4),
      velocityMultiplierDelta: Vector2(1.2, 1.2),
      repeat: ImageRepeat.repeat,
    );
  }

  void changeSpeed(Vector2 direction) {
    if (parallax == null) return;
    parallax!.baseVelocity = direction;
  }

  void changeSpeedBasedOnShip(Ship ship) {
    if (parallax == null) return;
    parallax!.baseVelocity = ship.direction * 10;
  }
}
