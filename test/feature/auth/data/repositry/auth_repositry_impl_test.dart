import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/repositry/auth_repositry_impl.dart';

import 'auth_repositry_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositryImpl authRepositoryImp;
  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepositoryImp = AuthRepositryImpl(mockAuthRemoteDataSource);
    provideDummy<Result<LoginResponse>>(FailedResult("Dummy Error"));
  });

  group("Auth Repositry", () {
    group("Login Repositry", () {
      final LoginRequest request = LoginRequest(
        email: "mariammohmed.25720@gmail.com",
        password: "Mariam257@",
      );
      final successResponse = LoginResponse(
        message: "success",
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2OGQwNDIyY2RkODkzN2UwNTczZWUwNmMiLCJpYXQiOjE3NTg1NTIyNzF9.PHzemBMcIvQJN2J0NWtzPU5q3JdGq1mXiISTq25qMpY",
      );
      test("return SuccessResult when data source success", () async {
        when(
          mockAuthRemoteDataSource.login(request),
        ).thenAnswer((_) async => SucessResult(successResponse));
        final result = await authRepositoryImp.login(request);
        expect((result), isA<Result<LoginResponse>>());
        expect((result as SucessResult).sucessResult, successResponse);
        verify(authRepositoryImp.login(request)).called(1);
      });
      test("return FailedResult when data source failed", () async {
        final exception = Exception("Throw Exception");
        when(
          mockAuthRemoteDataSource.login(request),
        ).thenAnswer((_) async => FailedResult(exception.toString()));
        final result = await authRepositoryImp.login(request);
        expect((result), isA<Result<LoginResponse>>());
        expect((result as FailedResult).errorMessage, exception.toString());
        verify(authRepositoryImp.login(request)).called(1);
      });
    });
  });
}
