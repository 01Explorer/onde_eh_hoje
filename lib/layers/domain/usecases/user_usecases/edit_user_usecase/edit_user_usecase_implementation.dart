import 'package:dartz/dartz.dart';
import '../../../entities/user_entity.dart';
import '../../../repositories/user_repositories/edit_user_repository/edit_user_repository.dart';
import 'edit_user_usecase.dart';

class EditUserUsecaseImplementation implements EditUserUsecase {
  final EditUserRepository repository;

  EditUserUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, User>> call(String id, String name) async {
    var response = await repository(id, name);
    return response.fold((l) => left(l), (r) => right(r));
  }
}