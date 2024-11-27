import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/ui/game_data.dart';

class ScoreText extends PositionComponent with HasGameRef {
  late TextComponent text;
  GameData data;

  ScoreText(this.data);

  @override
  FutureOr<void> onLoad() {
    text = TextComponent(
      position: Vector2(32, 32),
      text: "Score: ${data.score}",
      textRenderer: TextPaint(
        style: const TextStyle(
          fontFamily: "Arial",
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
    game.camera.viewport.add(text);
  }

  @override
  void update(double dt) {
    text.text = "Score: ${data.score}";
    super.update(dt);
  }
}
