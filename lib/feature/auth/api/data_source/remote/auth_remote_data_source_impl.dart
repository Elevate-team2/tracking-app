import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiServices _authApiServices;
  AuthRemoteDataSourceImpl(this._authApiServices);
  
  @override
  Future<Result<String>> forgetPassword(String email) async {
    try {
      final response = await _authApiServices.forgetPassword({Constants.email: email});
      if (response.info != null && response.info!.isNotEmpty) {
        return SucessResult<String>(response.info!);
      } else {
        final errorMessage = response.error ?? response.message ?? Constants.unknownError;
        return FailedResult<String>(errorMessage);
      }
    } on DioException catch (dioError) {
      final errorMessage = dioError.response?.data[Constants.error] ?? dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }

  
  @override
  Future<Result<String>> forgetPassword(String email) async {
    try {
      final response = await _authApiServices.forgetPassword({"email": email});
      if (response.info != null && response.info!.isNotEmpty) {
        return SucessResult<String>(response.info!);
      } else {
        final errorMessage =
            response.error ?? response.message ?? "Unknown error";
        return FailedResult<String>(errorMessage);
      }
    } on DioException catch (dioError) {
      final errorMessage = dioError.response?.data["error"] ?? dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }

  @override
  Future<Result<String>> verifyResetCode(String code) async {
    try {
      final response = await _authApiServices.verifyResetCode({
        "resetCode": code,
      });

      if (response['error'] != null &&
          (response['error'] as String).isNotEmpty) {
        return FailedResult<String>(response['error']!);
      }

      final message = response['status'] ?? response['message'] ?? "Success";
      return SucessResult<String>(message);
    } on DioException catch (dioError) {
      final errorMessage =
          dioError.response?.data['error'] ??
          dioError.response?.data['message'] ??
          dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }

  @override
  Future<Result<String>> resetPassword(String email, String newPassword) async {
    try {
      final response = await _authApiServices.resetPassword({
        "email": email,
        "newPassword": newPassword,
      });
      if (response.message != null && response.message!.isNotEmpty) {
        return SucessResult<String>(response.message!);
      } else {
        final errorMessage = response.error ?? "Unknown error";
        return FailedResult<String>(errorMessage);
      }
    } on DioException catch (dioError) {
      final errorMessage =
          dioError.response?.data['error'] ??
          dioError.response?.data['message'] ??
          dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }
}

