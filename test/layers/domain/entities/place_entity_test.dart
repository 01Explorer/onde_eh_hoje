import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import '../../../mocks/mocks.dart';

void main() {
  group('Place Entity', () {
    test('When created should return a place entity with the desired inputs',
        () {
      final Place placeTest = mockedPlace;

      expect(placeTest.id, "75d11f00-7ebe-4c8e-8fdd-6662db353d9c");
      expect(placeTest.id, isA<String>());
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
