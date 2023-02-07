import 'package:dartz/dartz.dart';
import '../../../entities/place_entity.dart';

abstract class FetchPlacesRepository {
  Future<Either<Exception, List<Place>>> fetchAllPlaces();
  Future<Either<Exception, Place>> fetchPlaceById(String id);
}
