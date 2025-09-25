import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password_response.dart';
import 'package:tracking_app/feature/auth/api/models/reset_password_response.dart';
import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiServices])
void main() {
  late MockAuthApiServices mockAuthApiServices;
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  setUp(() {
    mockAuthApiServices = MockAuthApiServices();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockAuthApiServices);
  });

  group("test forget password", () {
    String email = "test11@gmail.com";

    test(
      "should return SuccessResult when otp send to email/return info",
      () async {
        //arrange
        final fakeForgetPasswordResponse = ForgetPasswordResponse(
          info: "OTP sent to your email",
          message: "success",
        );
        when(
          mockAuthApiServices.forgetPassword({"email": email}),
        ).thenAnswer((_) async => fakeForgetPasswordResponse);

        //act
        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        //assert
        expect(result, isA<SucessResult<String>>());
        final success = result as SucessResult<String>;
        expect(success.sucessResult, "OTP sent to your email");
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      },
    );

    test("should return FailedResult when API return error ", () async {
      //arrange
      final fakeForgetPasswordResponse = ForgetPasswordResponse(
        error: "There is no account with this email address test11@gmail.com",
      );
      when(
        mockAuthApiServices.forgetPassword({"email": email}),
      ).thenAnswer((_) async => fakeForgetPasswordResponse);

      //act
      final result = await authRemoteDataSourceImpl.forgetPassword(email);

      //assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(
        error.errorMessage,
        "There is no account with this email address test11@gmail.com",
      );
      verify(mockAuthApiServices.forgetPassword(any)).called(1);
    });

    test("should return FailedResult when DioException is thrown", () async {
      // arrange
      final dioError = DioException(
        requestOptions: RequestOptions(path: "/forget-password"),
        response: Response(
          requestOptions: RequestOptions(path: "/forget-password"),
          statusCode: 400,
          data: {
            "error":
                "There is no account with this email address test@gmail.com",
          },
        ),
        type: DioExceptionType.badResponse,
      );

      when(mockAuthApiServices.forgetPassword(any)).thenThrow(dioError);

      // act
      final result = await authRemoteDataSourceImpl.forgetPassword(email);

      // assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(
        error.errorMessage,
        "There is no account with this email address test@gmail.com",
      );
      verify(mockAuthApiServices.forgetPassword(any)).called(1);
    });

    test(
      "should return FailedResult when generic exception is thrown",
      () async {
        //arrange
        when(
          mockAuthApiServices.forgetPassword(any),
        ).thenThrow(Exception("dio exception error"));

        //act
        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        //assert
        expect(result, isA<FailedResult<String>>());
        final error = result as FailedResult<String>;
        expect(error.errorMessage, Exception("dio exception error").toString());
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      },
    );
  });

  group("test verifyResetCode", () {
    const code = "123456";

    test("should return SuccessResult when code is valid", () async {
      // arrange
      final fakeResponse = {"status": "Code verified successfully"};
      when(mockAuthApiServices.verifyResetCode({"resetCode": code}))
          .thenAnswer((_) async => fakeResponse);

      // act
      final result = await authRemoteDataSourceImpl.verifyResetCode(code);

      // assert
      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Code verified successfully");
      verify(mockAuthApiServices.verifyResetCode(any)).called(1);
    });

    test("should return FailedResult when API returns error", () async {
      // arrange
      final fakeResponse = {"error": "Invalid reset code"};
      when(mockAuthApiServices.verifyResetCode({"resetCode": code}))
          .thenAnswer((_) async => fakeResponse);

      // act
      final result = await authRemoteDataSourceImpl.verifyResetCode(code);

      // assert
      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid reset code");
      verify(mockAuthApiServices.verifyResetCode(any)).called(1);
    });

    test("should return FailedResult when DioException is thrown", () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: "/verify-reset-code"),
        response: Response(
          requestOptions: RequestOptions(path: "/verify-reset-code"),
          statusCode: 400,
          data: {"error": "Invalid reset code"},
        ),
        type: DioExceptionType.badResponse,
      );

      when(mockAuthApiServices.verifyResetCode(any)).thenThrow(dioError);

      final result = await authRemoteDataSourceImpl.verifyResetCode(code);

      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid reset code");
      verify(mockAuthApiServices.verifyResetCode(any)).called(1);
    });
  });

  group("test resetPassword", () {
    const email = "test11@gmail.com";
    const newPassword = "12345678";

    test("should return SuccessResult when password is reset successfully", () async {
      // arrange
      final fakeResponse = ResetPasswordResponse(message: "Password reset successfully");
      when(mockAuthApiServices.resetPassword({"email": email, "newPassword": newPassword}))
          .thenAnswer((_) async => fakeResponse);

      // act
      final result = await authRemoteDataSourceImpl.resetPassword(email, newPassword);

      // assert
      expect(result, isA<SucessResult<String>>());
      final success = result as SucessResult<String>;
      expect(success.sucessResult, "Password reset successfully");
      verify(mockAuthApiServices.resetPassword(any)).called(1);
    });

    test("should return FailedResult when API returns error", () async {
      final fakeResponse = ResetPasswordResponse(error: "Invalid request");
      when(mockAuthApiServices.resetPassword({"email": email, "newPassword": newPassword}))
          .thenAnswer((_) async => fakeResponse);

      final result = await authRemoteDataSourceImpl.resetPassword(email, newPassword);

      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid request");
      verify(mockAuthApiServices.resetPassword(any)).called(1);
    });

    test("should return FailedResult when DioException is thrown", () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: "/reset-password"),
        response: Response(
          requestOptions: RequestOptions(path: "/reset-password"),
          statusCode: 400,
          data: {"error": "Invalid request"},
        ),
        type: DioExceptionType.badResponse,
      );

      when(mockAuthApiServices.resetPassword(any)).thenThrow(dioError);

      final result = await authRemoteDataSourceImpl.resetPassword(email, newPassword);

      expect(result, isA<FailedResult<String>>());
      final error = result as FailedResult<String>;
      expect(error.errorMessage, "Invalid request");
      verify(mockAuthApiServices.resetPassword(any)).called(1);
    });
  });
}
