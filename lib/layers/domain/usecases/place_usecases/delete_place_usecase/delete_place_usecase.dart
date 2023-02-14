import 'package:dartz/dartz.dart';

abstract class DeletePlaceUsecase {
  Future<Either<Exception, bool>> call(String id);
}
