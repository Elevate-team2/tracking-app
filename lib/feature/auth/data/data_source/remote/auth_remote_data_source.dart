import 'package:tracking_app/core/api_result/result.dart';

abstract interface class AuthRemoteDataSource{
  Future<Result<String>> forgetPassword(String email);
  Future<Result<String>> verifyResetCode(String code);
  Future<Result<String>> resetPassword(String email,String newPassword);
}