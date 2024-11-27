import 'dart:async';

import 'package:flame/components.dart';
import 'package:spaceshooter/ui/game_data.dart';
import 'package:spaceshooter/ui/live_ui_component.dart';

class LiveUi extends PositionComponent with HasGameRef {
  late GameData gameData;
  List<LiveUiComponent> lives = [];

  LiveUi(this.gameData);
  @override
  FutureOr<void> onLoad() {
    for (int i = 0; i < gameData.live; i++) {
      lives.add(LiveUiComponent());
      lives[i].position =
          Vector2(game.size.x - i * (lives[i].width + 50) - 30, 28);
      game.camera.viewport.add(lives[i]);
    }
    return super.onLoad();
  }

  void looseLive() {
    if (lives.isNotEmpty) {
      lives[lives.length - 1].removeFromParent();
      lives.removeLast();
    }
  }
}
