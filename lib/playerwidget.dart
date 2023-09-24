

import 'package:flutter/material.dart';

import 'timer.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({required super.key, required this.player, required this.onTap});

  final void Function(PersonTimer) onTap;
  final PersonTimer player;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: () => onTap(player),
      child: ColoredBox(
        color: player.isActive ? Colors.green : Colors.grey,
        child: Center(
          child: Text(
            player.displayTime(),
            textAlign: TextAlign.center,
          )
        )
      )
    );
  }
}