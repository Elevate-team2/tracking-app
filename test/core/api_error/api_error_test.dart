import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:tracking_app/core/api_error/api_error.dart';

void main() {
  group('ServerFailure.fromDioError', () {
    test('returns connectionTimeout error message', () {
      final dioError = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, "ServerFailure with Api Server");
    });

    test('returns sendTimeout error message', () {
      final dioError = DioException(
        type: DioExceptionType.sendTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, "sendTimeout with Api Server");
    });

    test('returns receiveTimeout error message', () {
      final dioError = DioException(
        type: DioExceptionType.receiveTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, "receiveTimeout with Api Server");
    });

    test('returns cancel error message', () {
      final dioError = DioException(
        type: DioExceptionType.cancel,
        requestOptions: RequestOptions(path: '/test'),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, " ServerFailure with Api Server was canceled");
    });

    test('returns connectionError error message', () {
      final dioError = DioException(
        type: DioExceptionType.connectionError,
        requestOptions: RequestOptions(path: '/test'),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, " ServerFailure with Api Server have an error");
    });

    test('returns no internet connection when message contains SocketException', () {
      final dioError = DioException(
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(path: '/test'),
        message: 'SocketException: Failed host lookup',
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'No Internet Connection');
    });

    test('returns unexpected error for unknown type', () {
      final dioError = DioException(
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(path: '/test'),
        message: 'Something else went wrong',
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'Unexpected Error, Please try again!');
    });

    test('returns fromResponse when badResponse with 400', () {
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'error': 'Invalid request'},
        ),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'Opps There was an Error, Please try again');
    });

    test('returns fromResponse when badResponse with 404', () {
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 404,
          data: {},
        ),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'Opps There was an Error, Please try again');
    });

    test('returns fromResponse when badResponse with 500', () {
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
          data: {},
        ),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'Opps There was an Error, Please try again');
    });

    test('returns default error for unknown status code', () {
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 999,
          data: {},
        ),
      );

      final failure = ServerFailure.fromDioError(dioError);
      expect(failure.errorMessage, 'Opps There was an Error, Please try again');
    });
  });
}
