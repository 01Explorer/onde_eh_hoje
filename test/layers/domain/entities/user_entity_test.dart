import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('User Entity', () {
    test('When created should return a User entity with the desired inputs',
        () {
      final User userMock = mockedUser;

      expect(userMock.id, 0);
      expect(userMock.id, isA<int>());
      expect(userMock.name, 'Gabriel');
      expect(userMock.name, isA<String>());
      expect(userMock.email, 'gabjhsa@gmail.com');
      expect(userMock.email, isA<String>());
    });
  });
}
