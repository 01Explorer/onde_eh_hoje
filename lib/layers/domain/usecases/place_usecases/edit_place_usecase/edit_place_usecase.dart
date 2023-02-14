import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';

abstract class EditPlaceUsecase {
  Future<Either<Exception, Place>> call(Place place,
      {String? name, double? latitude, double? longitude});
}
