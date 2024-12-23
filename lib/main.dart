import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spaceshooter/pages/game_over_overlay.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';
import 'package:spaceshooter/pages/start_menu_overlay.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GameWidget(
        game: SpaceShooterGame(),
        overlayBuilderMap: {
          "GameOver": (context, SpaceShooterGame game) {
            return GameOverOverlay(game);
          },
          "StartMenu": (context, SpaceShooterGame game) {
            return StartMenuOverlay(game: game);
          }
        },
        initialActiveOverlays: const ["StartMenu"],
      ),
    );
  }
}
