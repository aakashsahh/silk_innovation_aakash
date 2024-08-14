import 'package:flutter_bloc/flutter_bloc.dart';
import 'memory_game_event.dart';
import 'memory_game_state.dart';
import '../models/card_model.dart';

class MemoryGameBloc extends Bloc<MemoryGameEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameInitial()) {
    on<FlipCard>(_onFlipCard);
    on<ResetGame>(_onResetGame);
    add(ResetGame());
  }

  List<CardModel> _generateShuffledDeck() {
    List<String> cardNumbers = [
      'A',
      'K',
      'Q',
      'J',
      '10',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ]; // Add A, K, Q, J, 10 to the list
    List<CardModel> deck = [];

    for (String number in cardNumbers) {
      deck.add(CardModel(id: deck.length, number: number));
      deck.add(CardModel(id: deck.length, number: number));
    }

    deck.shuffle();
    return deck;
  }

  Future<void> _onFlipCard(
      FlipCard event, Emitter<MemoryGameState> emit) async {
    if (state is MemoryGameInProgress) {
      final currentState = state as MemoryGameInProgress;
      List<CardModel> updatedCards = List.from(currentState.cards);

      CardModel selectedCard = updatedCards[event.cardIndex];
      print(
          'Card tapped: ${selectedCard.number}, Flipped: ${selectedCard.isFlipped}, Matched: ${selectedCard.isMatched}'); // Debug statement

      if (!selectedCard.isFlipped && !selectedCard.isMatched) {
        selectedCard.isFlipped = true;
        updatedCards[event.cardIndex] = selectedCard;

        emit(MemoryGameInProgress(
            cards: updatedCards, moves: currentState.moves));

        print(
            'Card flipped: ${selectedCard.number}, Flipped: ${selectedCard.isFlipped}'); // Debug statement

        // Now check for matches
        final flippedCards = updatedCards
            .where((card) => card.isFlipped && !card.isMatched)
            .toList();
        print(
            'Flipped Cards: ${flippedCards.map((c) => c.number).toList()}'); // Debug statement

        if (flippedCards.length == 2) {
          await Future.delayed(
              const Duration(milliseconds: 500)); // Wait for 500ms

          if (flippedCards[0].number == flippedCards[1].number) {
            // Cards match
            updatedCards = updatedCards.map((card) {
              if (card.isFlipped && !card.isMatched) {
                print('Card matched: ${card.number}'); // Debug statement
                return card.copyWith(isMatched: true);
              }
              return card;
            }).toList();

            // Check if the game is complete
            if (updatedCards.every((card) => card.isMatched)) {
              print(
                  'Game completed in ${currentState.moves + 1} moves'); // Debug statement
              emit(MemoryGameCompleted(moves: currentState.moves + 1));
              return;
            }
          } else {
            // No match, flip cards back after a delay
            updatedCards = updatedCards.map((card) {
              if (card.isFlipped && !card.isMatched) {
                print('Card flipped back: ${card.number}'); // Debug statement
                return card.copyWith(isFlipped: false);
              }
              return card;
            }).toList();
          }
          emit(MemoryGameInProgress(
              cards: updatedCards, moves: currentState.moves + 1));
        }
      }
    }
  }

  void _onResetGame(ResetGame event, Emitter<MemoryGameState> emit) {
    List<CardModel> newDeck = _generateShuffledDeck();
    emit(MemoryGameInProgress(cards: newDeck, moves: 0));
    print('Game reset with new deck'); // Debug statement
  }
}
