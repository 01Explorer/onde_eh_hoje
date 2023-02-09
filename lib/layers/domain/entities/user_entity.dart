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

  Map<String, dynamic> toJson(User user) {
    return {
      'name': user.name,
      'email': email,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
