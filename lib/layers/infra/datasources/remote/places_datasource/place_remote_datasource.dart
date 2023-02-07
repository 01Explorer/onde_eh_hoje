import 'package:dartz/dartz.dart';
import '../../../../domain/entities/place_entity.dart';

abstract class PlaceRemoteDataSource {
  Future<Either<Exception, List<Place>>> fetchAllPlaces();
  Future<Either<Exception, Place>> fetchPlaceById(String id);
  Future<Either<Exception, Place>> registerPlace(Place place);
}
