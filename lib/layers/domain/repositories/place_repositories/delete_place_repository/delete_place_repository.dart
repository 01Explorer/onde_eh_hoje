import 'package:dartz/dartz.dart';

abstract class DeletePlaceRepository {
  Future<Either<Exception, bool>> call(String id);
}
