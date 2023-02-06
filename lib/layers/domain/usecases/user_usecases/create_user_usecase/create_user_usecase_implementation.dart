import 'package:dartz/dartz.dart';
import '../../../entities/user_entity.dart';
import '../../../repositories/user_repositories/create_user_repository/create_user_repository.dart';
import 'create_user_usecase.dart';

class CreateUserUsecaseImplementation implements CreateUserUsecase {
  final CreateUserRepository repository;

  CreateUserUsecaseImplementation(this.repository);

  @override
  Future<Either<Exception, User>> call(String name, String email) async {
    var response = await repository(User(name: name, email: email));
    return response.fold((l) => left(l), (r) => right(r));
  }
}
