class CardModel {
  final int id;
  final String number;
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
    String? number,
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
