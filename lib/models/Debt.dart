class Debt {
  final int id;
  final int userId;
  final int parts;
  final double value;
  final DateTime startAt;
  final DateTime endAt;
  final String description;

  const Debt({
    required this.id,
    required this.userId,
    required this.parts,
    required this.value,
    required this.startAt,
    required this.endAt,
    required this.description,
  });

  factory Debt.fromJson(Map<String, dynamic> json) {
    return Debt(
      id: json['id'],
      userId: json['userId'],
      parts: json['parts'],
      value: json['value'],
      startAt: json['startAt'],
      endAt: json['endAt'],
      description: json['description'],
    );
  }
}
