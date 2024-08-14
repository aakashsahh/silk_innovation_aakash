class CardModel {
  final int id;
  final int number;
  bool isFlipped;
  bool isMatched;

  CardModel({
    required this.id,
    required this.number,
    this.isFlipped = false,
    this.isMatched = false,
  });

  get identifier => null;

  CardModel copyWith({
    int? id,
    int? number,
    bool? isFlipped,
    bool? isMatched,
  }) {
    return CardModel(
      id: id ?? this.id,
      number: number ?? this.number,
      isFlipped: isFlipped ?? this.isFlipped,
      isMatched: isMatched ?? this.isMatched,
    );
  }
}
