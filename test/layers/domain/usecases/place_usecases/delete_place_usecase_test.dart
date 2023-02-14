import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/delete_place_repository/delete_place_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/delete_place_usecase/delete_place_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/delete_place_usecase/delete_place_usecase_implementation.dart';

class MockDeletePlaceRepository extends Mock implements DeletePlaceRepository {}

void main() {
  late DeletePlaceUsecase usecase;
  late DeletePlaceRepository repository;

  setUp(() {
    repository = MockDeletePlaceRepository();
    usecase = DeletePlaceUsecaseImplementation(repository);
  });

  group('DeletePlaceUsecase', () {
    test('If successful should return a true value', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => right(true));
      var response = await usecase('test');
      response.fold((l) {
        expect(l, isNull);
      }, (r) {
        expect(r, isA<bool>());
        expect(r, isTrue);
      });
    });
    test('If fails should return an Exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => left(Exception('fail to reach information')));
      var response = await usecase('test');
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('fail to reach information'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}
