

import 'package:flutter/material.dart';

import 'timer.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({required super.key, required this.onTap, required this.text});
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: () => onTap(),
      child: FittedBox(
          fit: BoxFit.fill,
          child: Text(text),
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({required super.key, required this.player, required this.onTap});

  final void Function(PersonTimer) onTap;
  final PersonTimer player;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: () => onTap(player),
      child: FittedBox(
          fit: BoxFit.fill,
          child: ColoredBox(
            color: player.isActive ? Colors.green : Colors.grey,
            child: Text(
              player.displayTime(),
            )
          )
      )
    );
  }
}