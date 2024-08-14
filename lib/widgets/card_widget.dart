import 'package:flutter/material.dart';
import 'package:silk_innovation_aakash/models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback onTap;

  const CardWidget({super.key, required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    print(
        'Card Widget Build: ${card.number}, Flipped: ${card.isFlipped}, Matched: ${card.isMatched}'); // Debug statement
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: card.isFlipped ? Colors.white : Colors.teal,
        child: Center(
          child: Text(
            card.isFlipped ? card.number : '',
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
