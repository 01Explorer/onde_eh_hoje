import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/delete_user_usecasee/delete_user_usecase.dart';
import '../../../repositories/user_repositories/delete_user_repository/delete_user_repository.dart';

class DeleteUserUsecaseImplementation implements DeleteUserUsecase {
  final DeleteUserRepository repository;

  DeleteUserUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, bool>> call(String id) async {
    var response = await repository(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}