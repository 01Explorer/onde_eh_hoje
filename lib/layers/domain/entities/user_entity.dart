class User {
  final String? id;
  final String name;
  final String email;

  User({
    this.id,
    required this.name,
    required this.email,
  });

  User copyWith({String? id, String? name, String? email}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
