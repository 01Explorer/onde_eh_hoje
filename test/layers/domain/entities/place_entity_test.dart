import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import '../../../mocks/mocks.dart';

void main() {
  group('Place Entity', () {
    test('When created should return a place entity with the desired inputs',
        () {
      final Place placeTest = mockedPlace;

      expect(placeTest.id, 0);
      expect(placeTest.id, isA<int>());
      expect(placeTest.name, 'Legend');
      expect(placeTest.name, isA<String>());
      expect(placeTest.latitude, -59.87432174921);
      expect(placeTest.latitude, isA<double>());
      expect(placeTest.longitude, 60.8320948);
      expect(placeTest.longitude, isA<double>());
      expect(placeTest, isA<Place>());
    });
  });
}
