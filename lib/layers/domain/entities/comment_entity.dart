import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

class Comment {
  final String? id;
  final User user;
  final String message;
  final Place place;
  late final DateTime createdAt;

  Comment({
    this.id,
    required this.user,
    required this.message,
    required this.place,
  }) {
    createdAt = DateTime.now();
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        user: User.fromJson(json['user']),
        message: json['message'],
        place: Place.fromJson(json['place']),
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(user),
      'message': message,
      'place': place.toJson()
    };
  }
}
