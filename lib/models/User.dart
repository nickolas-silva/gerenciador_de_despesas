class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String wage;
  final DateTime createdAt = DateTime.now();

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.wage,
    required this.password,
    required createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      wage: json['wage'],
      createdAt: json['createdAt'],
    );
  }
}
