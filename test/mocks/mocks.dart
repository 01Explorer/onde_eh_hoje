import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

final User mockedUser =
    User(id: 0, name: 'Gabriel', email: 'gabjhsa@gmail.com');

final Place mockedPlace = Place(
    id: 0, name: 'Legend', latitude: -59.87432174921, longitude: 60.8320948);

final Comment mockedComment = Comment(
    id: 0,
    user: mockedUser,
    message: 'This is a sample message',
    place: mockedPlace);
