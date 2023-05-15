class Debt {
  final int? id;
  final int userId;
  final String value;
  final String description;
  final DateTime date;

  const Debt({
    this.id,
    required this.userId,
    required this.value,
    required this.description,
    required this.date,
  });

  factory Debt.fromJson(Map<String, dynamic> json) {
    return Debt(
      id: json['id'],
      userId: json['userId'],
      value: json['value'],
      description: json['description'],
      date: DateTime.parse(json['startAt']),
    );
  }
}
