import 'package:dartz/dartz.dart';
import '../../../entities/place_entity.dart';

abstract class RegisterPlaceRepository {
  Future<Either<Exception, Place>> call(Place place);
}
