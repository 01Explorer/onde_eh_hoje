import 'package:dartz/dartz.dart';
import '../../../repositories/place_repositories/delete_place_repository/delete_place_repository.dart';
import 'delete_place_usecase.dart';

class DeletePlaceUsecaseImplementation implements DeletePlaceUsecase {
  final DeletePlaceRepository repository;

  DeletePlaceUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, bool>> call(String id) async {
    var response = await repository(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
