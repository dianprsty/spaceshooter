import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';

class GameOverOverlay extends StatelessWidget {
  final SpaceShooterGame game;
  const GameOverOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: game.size.x * 0.5,
        height: game.size.y * 0.5,
        child: Card(
          color: const Color.fromARGB(80, 55, 55, 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Game Over",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  game.reset();
                },
                child: const Text(
                  "Play Again",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
