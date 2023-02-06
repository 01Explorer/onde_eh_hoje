import 'package:dartz/dartz.dart';
import '../../../../domain/repositories/user_repositories/delete_user_repository/delete_user_repository.dart';
import '../../../datasources/remote/user_datasource/user_remote_datasource.dart';

class DeleteUserRepositoryImplementation implements DeleteUserRepository {
  final UserRemoteDataSource dataSource;

  DeleteUserRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, bool>> call(String id) async {
    var response = await dataSource.delete(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
