import 'package:dartz/dartz.dart';
import '../../../entities/place_entity.dart';
import '../../../repositories/place_repositories/fetch_places_repository/fetch_place_repository.dart';
import 'fetch_places_usecase.dart';

class FetchPlacesUsecaseImplementation implements FetchPlacesUsecase {
  final FetchPlacesRepository repository;

  FetchPlacesUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, List<Place>>> fetchAllPlaces() async {
    var response = await repository.fetchAllPlaces();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, Place>> fetchPlaceById(String id) async {
    var response = await repository.fetchPlaceById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
