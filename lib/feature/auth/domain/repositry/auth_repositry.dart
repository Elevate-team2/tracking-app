import '../../../../core/api_result/result.dart';
import '../../api/models/login/request/login_request.dart';
import '../../api/models/login/response/login_response.dart';

abstract interface class AuthRepositry{
  Future<Result<LoginResponse>> login(LoginRequest request);
}