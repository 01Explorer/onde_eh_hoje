import 'package:dartz/dartz.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/user_repositories/get_user_repository/get_user_repository.dart';
import '../../../datasources/remote/user_datasource/user_remote_datasource.dart';

class GetUserRepositoryImplementation implements GetUserRepository {
  final UserRemoteDataSource dataSource;

  GetUserRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, List<User>>> getAllUsers() async {
    var response = await dataSource.getAllUsers();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, User>> getUserById(String id) async {
    var response = await dataSource.getUserById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
