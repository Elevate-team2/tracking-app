import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';

abstract interface class AuthRemoteDataSource{
  Future<Result<LoginResponse>>login(LoginRequest request);

  Future<Result<String>> forgetPassword(String email);
  Future<Result<String>> verifyResetCode(String code);
  Future<Result<String>> resetPassword(String email,String newPassword);
}