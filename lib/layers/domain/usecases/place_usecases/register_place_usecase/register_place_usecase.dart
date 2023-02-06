import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';

abstract class RegisterPlaceUsecase {
  Future<Either<Exception, Place>> call(
      String name, double latitude, double longitude);
}
