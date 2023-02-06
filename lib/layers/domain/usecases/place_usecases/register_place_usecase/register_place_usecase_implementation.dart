import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/register_place_usecase/register_place_usecase.dart';
import '../../../entities/place_entity.dart';
import '../../../repositories/place_repositories/register_place_repository/register_place_repository.dart';

class RegisterPlaceUsecaseImplementation implements RegisterPlaceUsecase {
  final RegisterPlaceRepository repository;

  RegisterPlaceUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, Place>> call(
      String name, double latitude, double longitude) async {
    var response = await repository(
        Place(name: name, latitude: latitude, longitude: longitude));
    return response.fold((l) => left(l), (r) => right(r));
  }
}
