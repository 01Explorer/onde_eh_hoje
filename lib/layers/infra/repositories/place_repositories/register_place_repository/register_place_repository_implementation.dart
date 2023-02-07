import 'package:dartz/dartz.dart';
import '../../../../domain/entities/place_entity.dart';
import '../../../../domain/repositories/place_repositories/register_place_repository/register_place_repository.dart';
import '../../../datasources/remote/places_datasource/place_remote_datasource.dart';

class RegisterPlaceRepositoryImplementation implements RegisterPlaceRepository {
  final PlaceRemoteDataSource dataSource;

  RegisterPlaceRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, Place>> call(Place place) async {
    var response = await dataSource.registerPlace(place);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
