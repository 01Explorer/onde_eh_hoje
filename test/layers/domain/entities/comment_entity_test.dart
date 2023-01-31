import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('Comment Entity', () {
    test('When created should return a commenti entity with the desired inputs',
        () {
      final Comment commentTest = mockedComment;

      expect(commentTest.id, 0);
      expect(commentTest.id, isA<int>());
      expect(commentTest.user.name, mockedUser.name);
      expect(commentTest.user, isA<User>());
      expect(commentTest.createdAt, mockedComment.createdAt);
      expect(commentTest.createdAt, isA<DateTime>());
      expect(commentTest.message, mockedComment.message);
      expect(commentTest.message, isA<String>());
    });
  });
}
