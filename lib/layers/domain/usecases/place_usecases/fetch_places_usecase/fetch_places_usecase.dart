import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';

abstract class FetchPlacesUsecase {
  Future<Either<Exception, List<Place>>> fetchAllPlaces();
  Future<Either<Exception, Place>> fetchPlaceById(String id);
}
