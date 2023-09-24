
class PersonTimer {
  final String name;
  Duration _remaining;
  Duration? _start;
  Duration _active = Duration.zero;
  bool _isActive = false;

  PersonTimer(this.name, this._remaining) {
    _start = null;
  }

  void start() {
    if (!isActive){
      _active = Duration.zero;
      _isActive = true;
    }
  }

  void stop() {
    if (isActive) {
      _remaining -= _active;
      _start = null;
      _active = Duration.zero;
      _isActive = false;
    }
  }

  bool get isActive => _isActive;

  void tick(Duration reduced) {
    if (isActive) {
      _start ??= reduced;
      _active = reduced - _start!;
    }
  }

  String displayTime() {
    Duration currentRemaining = _remaining -  _active;
    return '${currentRemaining.isNegative ? '-' : ''}${currentRemaining.inMinutes.abs()}:${(currentRemaining.inSeconds.abs() % 60).toString().padLeft(2, '0')}';
   }
}

class GameTimer {
  final List<PersonTimer> _players;

  GameTimer(this._players);

  void tick(Duration reduced) {
    for (var player in _players) {
      player.tick(reduced);
    }
  }

  void activateNextPlayer() {
    for (int i =0 ; i< _players.length; i++) {
      if (_players[i].isActive) {
        _players[i].stop();
        _players[(i+1)%_players.length].start();
        return;
      }
    }

    if (_players.isNotEmpty)
    {
      _players[0].start();
    }
  }

  PersonTimer operator [](int i) => _players[i];
}