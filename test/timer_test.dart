// Import the test package and Counter class
import 'package:flutter_application_1/timer.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be decremented when activated', () {
    final counter = PersonTimer("test1", const Duration(minutes: 1, seconds: 1));

    counter.start();
    counter.tick(Duration.zero);
    counter.tick(const Duration(seconds: 1));

    expect(counter.displayTime(), '1:00');
  });

  test('Counter value should NOT be decremented when inactivate', () {
    final counter = PersonTimer("test1", const Duration(minutes: 1, seconds: 1));
    counter.tick(Duration.zero);
    counter.tick(const Duration(seconds: 1));

    expect(counter.displayTime(), '1:01');
  });

  test('Player 1 reduced player 2 not reduced', () {
    const startTime = Duration(minutes: 2, seconds: 2);
    final player1 = PersonTimer("test1", startTime);
    final player2 = PersonTimer("test2", startTime);
    final game = GameTimer([player1, player2]);
    game.activateNextPlayer();
    game.tick(Duration.zero);
    game.tick(const Duration(minutes: 1, seconds: 3));

    expect(player1.displayTime(), '0:59');
    expect(player2.displayTime(), '2:02');
  });

  test('Player 2 activated player 1 not reduced after tick', () {
    const startTime = Duration(minutes: 2, seconds: 2);
    final player1 = PersonTimer("test1", startTime);
    final player2 = PersonTimer("test2", startTime);
    final game = GameTimer([player1, player2]);
    game.activateNextPlayer();
    game.activateNextPlayer();
    game.tick(Duration.zero);
    game.tick(const Duration(minutes: 1, seconds: 3));

    expect(player1.displayTime(), '2:02');
    expect(player2.displayTime(), '0:59');
  });

  test('Duration is formatted as expected', () {
    final player1 = PersonTimer("test1", const Duration(minutes: 10));
    var displayTime = player1.displayTime();
    expect(displayTime, '10:00');
    player1.start();
    player1.tick(Duration.zero);
    player1.tick(const Duration(seconds: 1));
    displayTime = player1.displayTime();
    expect(displayTime, '9:59');
  });

  test('Time should go negative after 0', () {
    final player1 = PersonTimer("test1", Duration.zero);
    expect(player1.displayTime(), '0:00');
    player1.start();
    player1.tick(Duration.zero);
    player1.tick(const Duration(seconds: 1));
    expect(player1.displayTime(), '-0:01');
    player1.tick(const Duration(minutes: 10, seconds: 1));
    expect(player1.displayTime(), '-10:01');
  });
}