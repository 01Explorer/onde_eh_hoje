import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/fetch_places_repository/fetch_place_repository.dart';
import '../../../../domain/entities/place_entity.dart';
import '../../../datasources/remote/places_datasource/place_remote_datasource.dart';

class FetchPlacesRepositoryImplementation implements FetchPlacesRepository {
  final PlaceRemoteDataSource dataSource;

  FetchPlacesRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, List<Place>>> fetchAllPlaces() async {
    var response = await dataSource.fetchAllPlaces();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, Place>> fetchPlaceById(String id) async {
    var response = await dataSource.fetchPlaceById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
