

class PersonTimer {
  int secondsRemaining;
  bool isActive = false;

  PersonTimer(this.secondsRemaining) {
    isActive = false;
  }

  void tick(int secondsReduced) {
    if (isActive) {
      secondsRemaining -= secondsReduced;
    }
  }

  String displayTime() {
    return '${secondsRemaining < 0 ? '-' : ''}${(secondsRemaining / 60).abs().floor().toStringAsFixed(0)}:${(secondsRemaining.abs() % 60).toString().padLeft(2, '0')}';
  }
}

class GameTimer {
  final List<PersonTimer> _players;
  int _activePlayerIndex = 0;

  GameTimer(this._players) {
    _activePlayerIndex = 0;
    _players[_activePlayerIndex].isActive = true;
  }

  void tick(int timeReduced) {
    for (var player in _players) {
      player.tick(timeReduced);
    }
  }

  PersonTimer operator [](int i) => _players[i];

  PersonTimer activePlayer() => _players[_activePlayerIndex];

  void activateNextPlayer() {
    _players[_activePlayerIndex].isActive = false;
    _activePlayerIndex = (_activePlayerIndex + 1) % _players.length;
    _players[_activePlayerIndex].isActive = true;
  }
}