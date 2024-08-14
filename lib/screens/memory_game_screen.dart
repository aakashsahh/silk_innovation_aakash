import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/memory_game_bloc.dart';
import '../blocs/memory_game_event.dart';
import '../blocs/memory_game_state.dart';
import '../widgets/game_grid.dart';
import '../widgets/game_over_dialog.dart';

class MemoryGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Game'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<MemoryGameBloc>().add(ResetGame());
            },
          ),
        ],
      ),
      body: BlocBuilder<MemoryGameBloc, MemoryGameState>(
        builder: (context, state) {
          if (state is MemoryGameInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MemoryGameInProgress) {
            return GameGrid(cards: state.cards);
          } else if (state is MemoryGameCompleted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => GameOverDialog(moves: state.moves),
              );
            });
            return const Center(child: Text('Game Over!'));
          }
          return const Center(child: Text('Unexpected Error'));
        },
      ),
    );
  }
}
