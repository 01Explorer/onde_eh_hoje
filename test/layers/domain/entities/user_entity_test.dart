import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('User Entity', () {
    test('When created should return a User entity with the desired inputs',
        () {
      final User userMock = mockedUser;

      expect(userMock.id, "75d11f00-7ebe-4c8e-8fdd-6662db353d9c");
      expect(userMock.id, isA<String>());
      expect(userMock.name, 'Gabriel');
      expect(userMock.name, isA<String>());
      expect(userMock.email, 'gabjhsa@gmail.com');
      expect(userMock.email, isA<String>());
    });
  });
}
