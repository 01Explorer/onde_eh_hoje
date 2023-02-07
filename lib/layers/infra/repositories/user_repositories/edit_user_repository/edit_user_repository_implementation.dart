import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/edit_user_repository/edit_user_repository.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../datasources/remote/user_datasource/user_remote_datasource.dart';

class EditUserRepositoryImplementation implements EditUserRepository {
  final UserRemoteDataSource dataSource;

  EditUserRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Exception, User>> call(String id, String name) async {
    var response = await dataSource.edit(id, name);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
