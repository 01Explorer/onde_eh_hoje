import 'package:dartz/dartz.dart';
import '../../../../layers/domain/entities/user_entity.dart';
import '../../../../layers/domain/services/http_service/http_service.dart';
import '../../../../layers/domain/utils/utils.dart';
import '../../../../layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  final HttpService httpService;

  UserRemoteDataSourceImplementation(this.httpService);
  @override
  Future<Either<Exception, bool>> delete(String id) async {
    var response = await httpService
        .delete(Utils.deleteApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(true);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, User>> edit(String id, String name) async {
    var response = await httpService.put(Utils.putApiEndpoint,
        queryParameters: {'id': id}, data: {'name': name});
    if (response.statusCode != null) {
      return right(User.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, List<User>>> getAllUsers() async {
    var response = await httpService.get(Utils.getApiEndpoint);
    if (response.statusCode != null) {
      List<User> usersList = [];
      for (var element in response.data['users']) {
        usersList.add(User.fromJson(element));
      }
      return right(usersList);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, User>> getUserById(String id) async {
    var response = await httpService
        .get(Utils.getApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(User.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, User>> signUpUser(User user) async {
    var response =
        await httpService.post(Utils.postApiEndpoint, data: user.toJson(user));
    if (response.statusCode != null) {
      return right(response.data);
    }
    return left(Exception('Failed'));
  }
}
