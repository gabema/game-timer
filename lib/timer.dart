

class PersonTimer {
  int timeRemaining;
  bool isActive = false;

  PersonTimer(this.timeRemaining) {
    isActive = false;
  }

  void tick(int timeReduced) {
    if (isActive) {
      timeRemaining -= timeReduced;
    }
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

  PersonTimer activePlayer() => _players[_activePlayerIndex];

  void activateNextPlayer(PersonTimer activePlayer) {
    _players[_activePlayerIndex].isActive = false;
    _activePlayerIndex = (_activePlayerIndex + 1) % _players.length;
    _players[_activePlayerIndex].isActive = true;
  }
}