import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/services/http_service/http_service.dart';
import 'package:onde_eh_hoje/layers/domain/utils/utils.dart';
import 'package:onde_eh_hoje/layers/external/datasources/remote/comment_datasource/comment_remote_datasource_implementation.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/comment_datasource/comment_remote_datasource.dart';
import '../../../mocks/mocks.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  late HttpService httpService;
  late CommentRemoteDataSource dataSource;
  setUp(() {
    httpService = MockHttpService();
    dataSource = CommentRemoteDataSourceImplementation(httpService);
  });

  group('CommentDataSource', () {
    group('DeleteComment', () {
      test('If successful shouldn\'t return anything', () async {
        when(
          () => httpService.delete(Utils.deleteCommentApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
              requestOptions:
                  RequestOptions(path: Utils.deleteCommentApiEndpoint),
              statusCode: 200,
            ));

        var response = await dataSource.deleteComment('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) => null);
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.delete(Utils.deleteCommentApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
              requestOptions:
                  RequestOptions(path: Utils.deleteCommentApiEndpoint),
            ));

        var response = await dataSource.deleteComment('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) => null);
      });
    });
    group('FetchAllComments', () {
      test('If successful should return a list of comments', () async {
        when(
          () => httpService.get(Utils.getAllCommentApiEndpoint),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getAllCommentApiEndpoint),
            statusCode: 200,
            data: mockedListOfCommentsJson));

        var response = await dataSource.fetchAllComments();
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
          expect(r[0].place, isA<Place>());
          expect(r[0].user, isA<User>());
        });
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.get(Utils.getAllCommentApiEndpoint),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getAllCommentApiEndpoint)));

        var response = await dataSource.fetchAllComments();
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentById', () {
      test('If successful should return a comment', () async {
        when(
          () => httpService.get(Utils.getCommentApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getCommentApiEndpoint),
            statusCode: 200,
            data: mockedCommentJson));

        var response = await dataSource.fetchCommentById('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<Comment>());
          expect(r.place, isA<Place>());
          expect(r.user, isA<User>());
        });
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.get(Utils.getCommentApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getCommentApiEndpoint)));

        var response = await dataSource.fetchCommentById('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentByPlaceId', () {
      test('If successful should return a List of comments', () async {
        when(
          () => httpService.get(Utils.getCommentByPlaceApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getCommentByPlaceApiEndpoint),
            statusCode: 200,
            data: mockedListOfCommentsJson));

        var response = await dataSource.fetchCommentsByPlace('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
          expect(r[0].place, isA<Place>());
          expect(r[0].user, isA<User>());
        });
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.get(Utils.getCommentByPlaceApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getCommentByPlaceApiEndpoint)));

        var response = await dataSource.fetchCommentsByPlace('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentByUserId', () {
      test('If successful should return a List of comments', () async {
        when(
          () => httpService.get(Utils.getCommentByUserApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getCommentByUserApiEndpoint),
            statusCode: 200,
            data: mockedListOfCommentsJson));

        var response = await dataSource.fetchCommentsByUser('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
          expect(r[0].place, isA<Place>());
          expect(r[0].user, isA<User>());
        });
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.get(Utils.getCommentByUserApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.getCommentByUserApiEndpoint)));

        var response = await dataSource.fetchCommentsByUser('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('PostComment', () {
      test('If successful should return the posted comment', () async {
        when(
          () => httpService.post(Utils.postCommentApiEndpoint,
              data: mockedComment.toJson()),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.postCommentApiEndpoint),
            statusCode: 200,
            data: mockedCommentJson));

        var response = await dataSource.postComment(mockedComment);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<Comment>());
          expect(r.id, isNotNull);
          expect(r.createdAt, isNotNull);
        });
      });
      test('If it fails should return an Exception', () async {
        when(
          () => httpService.post(Utils.postCommentApiEndpoint,
              data: mockedComment.toJson()),
        ).thenAnswer((_) async => Response(
            requestOptions:
                RequestOptions(path: Utils.postCommentApiEndpoint)));

        var response = await dataSource.postComment(mockedComment);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
  });
}
