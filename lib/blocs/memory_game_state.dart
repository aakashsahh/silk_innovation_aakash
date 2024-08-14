import 'package:equatable/equatable.dart';
import 'package:silk_innovation_aakash/models/card_model.dart';

abstract class MemoryGameState extends Equatable {
  const MemoryGameState();

  @override
  List<Object> get props => [];
}

class MemoryGameInitial extends MemoryGameState {}

class MemoryGameInProgress extends MemoryGameState {
  final List<CardModel> cards;
  final int moves;

  const MemoryGameInProgress({required this.cards, required this.moves});

  @override
  List<Object> get props => [cards, moves];
}

class MemoryGameCompleted extends MemoryGameState {
  final int moves;

  const MemoryGameCompleted({required this.moves});

  @override
  List<Object> get props => [moves];
}
