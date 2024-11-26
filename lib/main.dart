import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GameWidget(game: SpaceShooterGame()),
    );
  }
}