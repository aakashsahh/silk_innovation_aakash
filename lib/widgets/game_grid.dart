import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silk_innovation_aakash/blocs/memory_game_bloc.dart';
import 'package:silk_innovation_aakash/blocs/memory_game_event.dart';
import 'package:silk_innovation_aakash/models/card_model.dart';
import 'package:silk_innovation_aakash/widgets/card_widget.dart';

class GameGrid extends StatefulWidget {
  final List<CardModel> cards;

  GameGrid({required this.cards});

  @override
  _GameGridState createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: widget.cards.length,
      itemBuilder: (context, index) {
        final card = widget.cards[index];
        return CardWidget(
          card: card,
          onTap: () {
            if (!card.isFlipped && !card.isMatched) {
              context.read<MemoryGameBloc>().add(FlipCard(index));
              setState(() {}); // Add this line to rebuild the widget tree
            }
          },
        );
      },
    );
  }
}
