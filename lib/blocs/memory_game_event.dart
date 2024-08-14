import 'package:equatable/equatable.dart';

abstract class MemoryGameEvent extends Equatable {
  const MemoryGameEvent();

  @override
  List<Object> get props => [];
}

class FlipCard extends MemoryGameEvent {
  final int cardIndex;

  const FlipCard(this.cardIndex);

  @override
  List<Object> get props => [cardIndex];
}

class ResetGame extends MemoryGameEvent {}
