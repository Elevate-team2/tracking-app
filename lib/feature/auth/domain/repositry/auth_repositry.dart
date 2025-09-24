import 'package:tracking_app/core/api_result/result.dart';

abstract interface class AuthRepositry{
  Future<Result<String>> forgetPassword(String email);
  Future<Result<String>> verifyResetCode(String code);

}