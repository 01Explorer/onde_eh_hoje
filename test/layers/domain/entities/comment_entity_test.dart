import 'package:flutter_test/flutter_test.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('Comment Entity', () {
    test('When created should return a comment entity with the desired inputs',
        () {
      final Comment commentTest = mockedComment;

      expect(commentTest.id, "75d11f00-7ebe-4c8e-8fdd-6662db353d9c");
      expect(commentTest.id, isA<String>());
      expect(commentTest.user.name, mockedUser.name);
      expect(commentTest.user, isA<User>());
      expect(commentTest.createdAt, mockedComment.createdAt);
      expect(commentTest.createdAt, isA<DateTime>());
      expect(commentTest.message, mockedComment.message);
      expect(commentTest.message, isA<String>());
    });
    test('The entity can be created without passing a id since it\'s nullable',
        () {
      final Comment commentTest = mockedNullIdComment;

      expect(commentTest.id, isNull);
      expect(commentTest.user.name, mockedUser.name);
      expect(commentTest.user, isA<User>());
      expect(commentTest.createdAt, mockedNullIdComment.createdAt);
      expect(commentTest.createdAt, isA<DateTime>());
      expect(commentTest.message, mockedNullIdComment.message);
      expect(commentTest.message, isA<String>());
    });
  });
}
