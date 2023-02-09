import 'package:dartz/dartz.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/services/http_service/http_service.dart';
import '../../../../domain/utils/utils.dart';
import '../../../../infra/datasources/remote/user_datasource/user_remote_datasource.dart';

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  final HttpService httpService;

  UserRemoteDataSourceImplementation(this.httpService);
  @override
  Future<Either<Exception, bool>> delete(String id) async {
    var response = await httpService
        .delete(Utils.deleteUserApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(true);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, User>> edit(String id, String name) async {
    var response = await httpService.put(Utils.putUserApiEndpoint,
        queryParameters: {'id': id}, data: {'name': name});
    if (response.statusCode != null) {
      return right(User.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, List<User>>> getAllUsers() async {
    var response = await httpService.get(Utils.getUserApiEndpoint);
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
        .get(Utils.getUserApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(User.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, User>> signUpUser(User user) async {
    var response = await httpService.post(Utils.postUserApiEndpoint,
        data: user.toJson(user));
    if (response.statusCode != null) {
      return right(response.data);
    }
    return left(Exception('Failed'));
  }
}
