class User {
  final int id;
  final String name;
  final String email;
  final String wage;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.wage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      wage: json['wage'],
    );
  }
}
