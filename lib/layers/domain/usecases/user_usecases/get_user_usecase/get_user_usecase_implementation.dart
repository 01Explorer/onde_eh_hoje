import 'package:dartz/dartz.dart';
import '../../../entities/user_entity.dart';
import '../../../repositories/user_repositories/get_user_repository/get_user_repository.dart';
import 'get_user_usecase.dart';

class GetUserUsecaseImplementation extends GetUserUsecase {
  final GetUserRepository repository;

  GetUserUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, List<User>>> getAllUsers() async {
    var response = await repository.getAllUsers();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, User>> getUserById(String id) async {
    var response = await repository.getUserById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
