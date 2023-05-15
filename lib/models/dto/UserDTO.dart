class UserDTO {
  final String name;
  final String email;
  final String password;
  final double wage;
  final DateTime createdAt = DateTime.now();

  UserDTO({
    required this.name,
    required this.email,
    required this.wage,
    required this.password,
  });
}
