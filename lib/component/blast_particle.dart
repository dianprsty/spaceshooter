import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/painting.dart';

class BlastParticle extends ParticleSystemComponent {
  Vector2 particlePosition;
  double speed = 50;
  double radius;

  BlastParticle({required this.particlePosition, this.radius = 0});

  @override
  FutureOr<void> onLoad() {
    Random random = Random();
    particle = Particle.generate(
      count: 50,
      generator: (idx) {
        Vector2 direction =
            Vector2(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1) *
                random.nextDouble() *
                speed;
        return MovingParticle(
          child: CircleParticle(
              lifespan: 4,
              radius: radius * 20,
              paint: Paint()
                ..color =
                    Color.fromARGB(255, 255, random.nextInt(155) + 100, 0)),
          from: particlePosition,
          to: particlePosition + direction,
        );
      },
    );
  }
}
