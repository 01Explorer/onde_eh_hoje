import 'package:dartz/dartz.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/user_repositories/create_user_repository/create_user_repository.dart';
import '../../../datasources/remote/user_datasource/user_remote_datasource.dart';

class CreateUserRepositoryImplementation implements CreateUserRepository {
  final UserRemoteDataSource dataSource;

  CreateUserRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, User>> call(User user) async {
    var response = await dataSource.signUpUser(user);
    return response.fold((l) => left(l), (r) => right(r));
  }
}