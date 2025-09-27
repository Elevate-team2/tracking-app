import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password/reset_password_response.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([AuthApiServices])
void main() {
  late MockAuthApiServices mockAuthApiServices;
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  setUp(() {
    mockAuthApiServices = MockAuthApiServices();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(mockAuthApiServices);
  });

  group("AuthRemoteDataSourceImpl Tests", () {
    group("Login", () {
      final request = LoginRequest(
        email: "mariammohmed.25720@gmail.com",
        password: "Mariam257@",
      );
      final successResponse = LoginResponse(
        message: "success",
        token: "dummy_token",
      );

      test("return SuccessResult when API call succeeds", () async {
        when(mockAuthApiServices.login(request))
            .thenAnswer((_) async => successResponse);

        final result = await authRemoteDataSourceImpl.login(request);

        expect(result, isA<SucessResult<LoginResponse>>());
        expect((result as SucessResult).sucessResult, successResponse);
        verify(mockAuthApiServices.login(request)).called(1);
      });

      test("return FailedResult when DioException is thrown", () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: "/"),
          type: DioExceptionType.connectionTimeout,
        );
        when(mockAuthApiServices.login(request)).thenThrow(dioException);

        final result = await authRemoteDataSourceImpl.login(request);

        expect(result, isA<FailedResult<LoginResponse>>());
        expect((result as FailedResult).errorMessage,
            "ServerFailure with Api Server");
        verify(mockAuthApiServices.login(request)).called(1);
      });

      test("return FailedResult when generic Exception is thrown", () async {
        final exception = Exception("Unexpected error");
        when(mockAuthApiServices.login(request)).thenThrow(exception);

        final result = await authRemoteDataSourceImpl.login(request);

        expect(result, isA<FailedResult<LoginResponse>>());
        expect((result as FailedResult).errorMessage, exception.toString());
        verify(mockAuthApiServices.login(request)).called(1);
      });
    });

    group("Forget Password", () {
      const email = "test11@gmail.com";

      test("return SuccessResult when OTP is sent", () async {
        final fakeResponse =
            ForgetPasswordResponse(info: "OTP sent to your email", message: "success");
        when(mockAuthApiServices.forgetPassword({"email": email}))
            .thenAnswer((_) async => fakeResponse);

        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        expect(result, isA<SucessResult<String>>());
        expect((result as SucessResult).sucessResult, "OTP sent to your email");
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      });

      test("return FailedResult when API returns error", () async {
        final fakeResponse = ForgetPasswordResponse(
            error: "There is no account with this email address $email");
        when(mockAuthApiServices.forgetPassword({"email": email}))
            .thenAnswer((_) async => fakeResponse);

        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage,
            "There is no account with this email address $email");
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      });

      test("return FailedResult when DioException is thrown", () async {
        final dioError = DioException(
          requestOptions: RequestOptions(path: "/forget-password"),
          response: Response(
            requestOptions: RequestOptions(path: "/forget-password"),
            statusCode: 400,
            data: {
              "error": "There is no account with this email address $email",
            },
          ),
          type: DioExceptionType.badResponse,
        );
        when(mockAuthApiServices.forgetPassword(any)).thenThrow(dioError);

        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage,
            "There is no account with this email address $email");
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      });

      test("return FailedResult when generic Exception is thrown", () async {
        when(mockAuthApiServices.forgetPassword(any))
            .thenThrow(Exception("Unexpected error"));

        final result = await authRemoteDataSourceImpl.forgetPassword(email);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage,
            Exception("Unexpected error").toString());
        verify(mockAuthApiServices.forgetPassword(any)).called(1);
      });
    });

    group("Verify Reset Code", () {
      const code = "123456";

      test("return SuccessResult when code is valid", () async {
        final fakeResponse = {"status": "Code verified successfully"};
        when(mockAuthApiServices.verifyResetCode({"resetCode": code}))
            .thenAnswer((_) async => fakeResponse);

        final result = await authRemoteDataSourceImpl.verifyResetCode(code);

        expect(result, isA<SucessResult<String>>());
        expect((result as SucessResult).sucessResult, "Code verified successfully");
        verify(mockAuthApiServices.verifyResetCode(any)).called(1);
      });

      test("return FailedResult when API returns error", () async {
        final fakeResponse = {"error": "Invalid reset code"};
        when(mockAuthApiServices.verifyResetCode({"resetCode": code}))
            .thenAnswer((_) async => fakeResponse);

        final result = await authRemoteDataSourceImpl.verifyResetCode(code);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage, "Invalid reset code");
        verify(mockAuthApiServices.verifyResetCode(any)).called(1);
      });

      test("return FailedResult when DioException is thrown", () async {
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
        expect((result as FailedResult).errorMessage, "Invalid reset code");
        verify(mockAuthApiServices.verifyResetCode(any)).called(1);
      });
    });

    group("Reset Password", () {
      const email = "test11@gmail.com";
      const newPassword = "12345678";

      test("return SuccessResult when reset is successful", () async {
        final fakeResponse =
            ResetPasswordResponse(message: "Password reset successfully");
        when(mockAuthApiServices
                .resetPassword({"email": email, "newPassword": newPassword}))
            .thenAnswer((_) async => fakeResponse);

        final result =
            await authRemoteDataSourceImpl.resetPassword(email, newPassword);

        expect(result, isA<SucessResult<String>>());
        expect((result as SucessResult).sucessResult, "Password reset successfully");
        verify(mockAuthApiServices.resetPassword(any)).called(1);
      });

      test("return FailedResult when API returns error", () async {
        final fakeResponse = ResetPasswordResponse(error: "Invalid request");
        when(mockAuthApiServices
                .resetPassword({"email": email, "newPassword": newPassword}))
            .thenAnswer((_) async => fakeResponse);

        final result =
            await authRemoteDataSourceImpl.resetPassword(email, newPassword);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage, "Invalid request");
        verify(mockAuthApiServices.resetPassword(any)).called(1);
      });

      test("return FailedResult when DioException is thrown", () async {
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

        final result =
            await authRemoteDataSourceImpl.resetPassword(email, newPassword);

        expect(result, isA<FailedResult<String>>());
        expect((result as FailedResult).errorMessage, "Invalid request");
        verify(mockAuthApiServices.resetPassword(any)).called(1);
      });
    });
  });
}
