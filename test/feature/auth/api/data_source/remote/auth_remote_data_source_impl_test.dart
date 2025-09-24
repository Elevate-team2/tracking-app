import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiServices])
void main() {
  late MockAuthApiServices mockAuthApiServices;
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  setUp(() {
    mockAuthApiServices = MockAuthApiServices();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockAuthApiServices);
  });
  group("Auth RemoteDataSource", () {
    group("Login Tests", () {
      final LoginRequest request = LoginRequest(
        email: "mariammohmed.25720@gmail.com",
        password: "Mariam257@",
      );
      final successResponse = LoginResponse(
        message: "success",
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2OGQwNDIyY2RkODkzN2UwNTczZWUwNmMiLCJpYXQiOjE3NTg1NTIyNzF9.PHzemBMcIvQJN2J0NWtzPU5q3JdGq1mXiISTq25qMpY",
      );
      test("return SuccessResult when call api and success", () async {
        when(
          mockAuthApiServices.login(request),
        ).thenAnswer((_) async => successResponse);
        final result = await authRemoteDataSourceImpl.login(request);
        expect(result, isA<Result<LoginResponse>>());
        expect((result as SucessResult).sucessResult, successResponse);
        verify(mockAuthApiServices.login(request)).called(1);
      });
      test(
        "return FailedResult when call api and failed on dioException",
        () async {
          final dioException = DioException(
            requestOptions: RequestOptions(path: "/"),
            type: DioExceptionType.connectionTimeout,
          );
          when(mockAuthApiServices.login(request)).thenThrow(dioException);
          final result = await authRemoteDataSourceImpl.login(request);
          expect(result, isA<Result<LoginResponse>>());
          expect(
            (result as FailedResult).errorMessage,
            "ServerFailure with Api Server",
          );
          verify(mockAuthApiServices.login(request)).called(1);
        },
      );
      test(
        "return FailedResult when call api and failed on Exception",
        () async {
          final exception = Exception("Throw Exception");
          when(mockAuthApiServices.login(request)).thenThrow(exception);
          final result = await authRemoteDataSourceImpl.login(request);
          expect(result, isA<Result<LoginResponse>>());
          expect((result as FailedResult).errorMessage, exception.toString());
          verify(mockAuthApiServices.login(request)).called(1);
        },
      );
    });
  });
}
