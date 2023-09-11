// Import the test package and Counter class
import 'package:flutter_application_1/timer.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be decremented when activated', () {
    const startTime = 1000;
    final counter = PersonTimer(startTime);
    const offset = 100;

    counter.timeRemaining = startTime;
    counter.isActive = true;

    counter.tick(offset);

    expect(counter.timeRemaining, startTime - offset);
  });

  test('Counter value should NOT be decremented when inactivate', () {
    const startTime = 1000;
    final counter = PersonTimer(startTime);
    const offset = 100;

    counter.timeRemaining = startTime;
    counter.isActive = false;

    counter.tick(offset);

    expect(counter.timeRemaining, startTime);
  });

  test('Player 1 reduced player 2 not reduced', () {
    const startTime = 1000;
    const offset = 100;
    final player1 = PersonTimer(startTime);
    final player2 = PersonTimer(startTime);
    final game = GameTimer([player1, player2]);

    game.tick(offset);

    expect(player1.timeRemaining, startTime - offset);
    expect(player2.timeRemaining, startTime);
  });
    test('Player 2 activated player 1 not reduced after tick', () {
    const startTime = 1000;
    const offset = 100;
    final player1 = PersonTimer(startTime);
    final player2 = PersonTimer(startTime);
    final game = GameTimer([player1, player2]);

    game.activateNextPlayer(game.activePlayer());
    game.tick(offset);

    expect(player2.timeRemaining, startTime - offset);
    expect(player1.timeRemaining, startTime);
  });
}