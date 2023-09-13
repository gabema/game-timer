// Import the test package and Counter class
import 'package:flutter_application_1/timer.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be decremented when activated', () {
    const startTime = 1000;
    final counter = PersonTimer(startTime);
    const offset = 100;

    counter.secondsRemaining = startTime;
    counter.isActive = true;

    counter.tick(offset);

    expect(counter.secondsRemaining, startTime - offset);
  });

  test('Counter value should NOT be decremented when inactivate', () {
    const startTime = 1000;
    final counter = PersonTimer(startTime);
    const offset = 100;

    counter.secondsRemaining = startTime;
    counter.isActive = false;

    counter.tick(offset);

    expect(counter.secondsRemaining, startTime);
  });

  test('Player 1 reduced player 2 not reduced', () {
    const startTime = 1000;
    const offset = 100;
    final player1 = PersonTimer(startTime);
    final player2 = PersonTimer(startTime);
    final game = GameTimer([player1, player2]);

    game.tick(offset);

    expect(player1.secondsRemaining, startTime - offset);
    expect(player2.secondsRemaining, startTime);
  });

  test('Player 2 activated player 1 not reduced after tick', () {
    const startTime = 1000;
    const offset = 100;
    final player1 = PersonTimer(startTime);
    final player2 = PersonTimer(startTime);
    final game = GameTimer([player1, player2]);

    game.activateNextPlayer();
    game.tick(offset);

    expect(player2.secondsRemaining, startTime - offset);
    expect(player1.secondsRemaining, startTime);
  });

  test('Duration is formatted as expected', () {
    final startTime = const Duration(minutes: 10).inSeconds;
    final player1 = PersonTimer(startTime);
    var displayTime = player1.displayTime();
    expect(displayTime, '10:00');
    player1.isActive = true;
    player1.tick(1);
    displayTime = player1.displayTime();
    expect(displayTime, '9:59');
  });

  test('Time should go negative after 0', () {
    final player1 = PersonTimer(0);
    expect(player1.displayTime(), '0:00');
    player1.isActive = true;
    player1.tick(1);
    expect(player1.displayTime(), '-0:01');
    player1.tick(const Duration(minutes: 10).inSeconds);
    expect(player1.displayTime(), '-10:01');
  });
}