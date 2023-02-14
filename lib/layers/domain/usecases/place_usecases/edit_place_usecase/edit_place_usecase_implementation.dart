import 'package:dartz/dartz.dart';
import '../../../entities/place_entity.dart';
import '../../../repositories/place_repositories/edit_place_repository/edit_place_repository.dart';
import 'edit_place_usecase.dart';

class EditPlaceUsecaseImplementation implements EditPlaceUsecase {
  final EditPlaceRepository repository;

  EditPlaceUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, Place>> call(Place place,
      {String? name, double? latitude, double? longitude}) async {
    var response = await repository(
        place.copyWith(name: name, latitude: latitude, longitude: longitude));
    return response.fold((l) => left(l), (r) => right(r));
  }
}
