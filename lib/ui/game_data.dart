class GameData {
  late int _score;
  late int _live;

  GameData(this._score, this._live);

  int get score => _score;
  int get live => _live;

  void addScore(int score) {
    _score += score;
  }

  void addLive(int live) {
    _live += live;
  }

  void loseLive(int live) {
    _live -= live;
  }
}
