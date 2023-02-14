import 'package:dartz/dartz.dart';
import '../../../entities/place_entity.dart';

abstract class EditPlaceRepository {
  Future<Either<Exception, Place>> call(Place place);
}
