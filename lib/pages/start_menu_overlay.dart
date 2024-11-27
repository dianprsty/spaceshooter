import 'package:flutter/material.dart';
import 'package:spaceshooter/pages/space_shooter_game.dart';

class StartMenuOverlay extends StatelessWidget {
  final SpaceShooterGame game;
  const StartMenuOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: game.size.x * 0.5,
        height: game.size.y * 0.5,
        child: Card(
          color: const Color.fromARGB(100, 55, 102, 233),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Space Shooter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Image.asset("assets/images/ships/spaceShips_001.png"),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  game.resumeEngine();
                  game.overlays.remove("StartMenu");
                },
                child: const Text(
                  "Play Game",
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
