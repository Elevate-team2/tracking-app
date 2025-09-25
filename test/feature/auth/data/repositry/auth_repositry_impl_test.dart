import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/repositry/auth_repositry_impl.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import 'auth_repositry_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositryImpl authRepositoryImp;
  late AuthRepositry authRepository;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepositoryImp = AuthRepositryImpl(mockAuthRemoteDataSource);
    authRepository = AuthRepositryImpl(mockAuthRemoteDataSource);

    // Dummy values
    provideDummy<Result<String>>(SucessResult<String>("success"));
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
        when(mockAuthRemoteDataSource.login(request))
            .thenAnswer((_) async => SucessResult(successResponse));

        final result = await authRepositoryImp.login(request);

        expect(result, isA<Result<LoginResponse>>());
        expect((result as SucessResult).sucessResult, successResponse);
        verify(mockAuthRemoteDataSource.login(request)).called(1);
      });

      test("return FailedResult when data source failed", () async {
        final exception = Exception("Throw Exception");
        when(mockAuthRemoteDataSource.login(request))
            .thenAnswer((_) async => FailedResult(exception.toString()));

        final result = await authRepositoryImp.login(request);

        expect(result, isA<Result<LoginResponse>>());
        expect((result as FailedResult).errorMessage, exception.toString());
        verify(mockAuthRemoteDataSource.login(request)).called(1);
      });
    });

    group("Forget Password", () {
      const String email = "test@gmail.com";

      test("should return SuccessResult when remote call succeeds", () async {
        when(mockAuthRemoteDataSource.forgetPassword(email))
            .thenAnswer((_) async => SucessResult<String>("OTP sent to your email"));

        final result = await authRepository.forgetPassword(email);

        expect(result, isA<SucessResult<String>>());
        final success = result as SucessResult<String>;
        expect(success.sucessResult, "OTP sent to your email");
        verify(mockAuthRemoteDataSource.forgetPassword(email)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });

      test("should return FailedResult when remote call fails", () async {
        when(mockAuthRemoteDataSource.forgetPassword(email))
            .thenAnswer((_) async => FailedResult<String>("Server error"));

        final result = await authRepository.forgetPassword(email);

        expect(result, isA<FailedResult<String>>());
        final error = result as FailedResult<String>;
        expect(error.errorMessage, "Server error");
        verify(mockAuthRemoteDataSource.forgetPassword(email)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });
    });

    group("Verify Reset Code", () {
      const code = "123456";

      test("should return SuccessResult when remote call succeeds", () async {
        when(mockAuthRemoteDataSource.verifyResetCode(code))
            .thenAnswer((_) async => SucessResult<String>("Code verified successfully"));

        final result = await authRepository.verifyResetCode(code);

        expect(result, isA<SucessResult<String>>());
        final success = result as SucessResult<String>;
        expect(success.sucessResult, "Code verified successfully");
        verify(mockAuthRemoteDataSource.verifyResetCode(code)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });

      test("should return FailedResult when remote call fails", () async {
        when(mockAuthRemoteDataSource.verifyResetCode(code))
            .thenAnswer((_) async => FailedResult<String>("Invalid reset code"));

        final result = await authRepository.verifyResetCode(code);

        expect(result, isA<FailedResult<String>>());
        final error = result as FailedResult<String>;
        expect(error.errorMessage, "Invalid reset code");
        verify(mockAuthRemoteDataSource.verifyResetCode(code)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });
    });

    group("Reset Password", () {
      const email = "test@gmail.com";
      const newPassword = "12345678";

      test("should return SuccessResult when remote call succeeds", () async {
        when(mockAuthRemoteDataSource.resetPassword(email, newPassword))
            .thenAnswer((_) async => SucessResult<String>("Password reset successfully"));

        final result = await authRepository.resetPassword(email, newPassword);

        expect(result, isA<SucessResult<String>>());
        final success = result as SucessResult<String>;
        expect(success.sucessResult, "Password reset successfully");
        verify(mockAuthRemoteDataSource.resetPassword(email, newPassword)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });

      test("should return FailedResult when remote call fails", () async {
        when(mockAuthRemoteDataSource.resetPassword(email, newPassword))
            .thenAnswer((_) async => FailedResult<String>("Invalid request"));

        final result = await authRepository.resetPassword(email, newPassword);

        expect(result, isA<FailedResult<String>>());
        final error = result as FailedResult<String>;
        expect(error.errorMessage, "Invalid request");
        verify(mockAuthRemoteDataSource.resetPassword(email, newPassword)).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      });
    });
  });
}

