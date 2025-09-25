import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/repositry/auth_repositry_impl.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import 'auth_repositry_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositry authRepository;

  setUp(() {
    provideDummy<Result<String>>(
      SucessResult<String>("success"),
    );
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepositryImpl(mockAuthRemoteDataSource);
  });

  group("test forget password", () {
    const String email = "test@gmail.com";

    test("should return SuccessResult when remote call succeeds", () async {
      // arrange
      when(mockAuthRemoteDataSource.forgetPassword(email))
          .thenAnswer((_) async => SucessResult<String>("OTP sent to your email"));

      // act
      final result = await authRepository.forgetPassword(email);

      // assert
      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "OTP sent to your email");
      verify(mockAuthRemoteDataSource.forgetPassword(email)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test("should return FailedResult when remote call fails", () async {
      // arrange
      when(mockAuthRemoteDataSource.forgetPassword(email))
          .thenAnswer((_) async => FailedResult<String>("Server error"));

      // act
      final result = await authRepository.forgetPassword(email);

      // assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Server error");
      verify(mockAuthRemoteDataSource.forgetPassword(email)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });

  group("test verifyResetCode", () {
    const code = "123456";

    test("should return SuccessResult when remote call succeeds", () async {
      // arrange
      when(mockAuthRemoteDataSource.verifyResetCode(code))
          .thenAnswer((_) async => SucessResult<String>("Code verified successfully"));

      // act
      final result = await authRepository.verifyResetCode(code);

      // assert
      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Code verified successfully");
      verify(mockAuthRemoteDataSource.verifyResetCode(code)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test("should return FailedResult when remote call fails", () async {
      // arrange
      when(mockAuthRemoteDataSource.verifyResetCode(code))
          .thenAnswer((_) async => FailedResult<String>("Invalid reset code"));

      // act
      final result = await authRepository.verifyResetCode(code);

      // assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid reset code");
      verify(mockAuthRemoteDataSource.verifyResetCode(code)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });

  group("test resetPassword", () {
    const email = "test@gmail.com";
    const newPassword = "12345678";

    test("should return SuccessResult when remote call succeeds", () async {
      // arrange
      when(mockAuthRemoteDataSource.resetPassword(email, newPassword))
          .thenAnswer((_) async => SucessResult<String>("Password reset successfully"));

      // act
      final result = await authRepository.resetPassword(email, newPassword);

      // assert
      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Password reset successfully");
      verify(mockAuthRemoteDataSource.resetPassword(email, newPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test("should return FailedResult when remote call fails", () async {
      // arrange
      when(mockAuthRemoteDataSource.resetPassword(email, newPassword))
          .thenAnswer((_) async => FailedResult<String>("Invalid request"));

      // act
      final result = await authRepository.resetPassword(email, newPassword);

      // assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid request");
      verify(mockAuthRemoteDataSource.resetPassword(email, newPassword)).called(1);
      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });
}
