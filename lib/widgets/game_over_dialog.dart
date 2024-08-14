import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  final int moves;

  GameOverDialog({required this.moves});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Game Over'),
      content: Text('Congratulations! You completed the game in $moves moves.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
