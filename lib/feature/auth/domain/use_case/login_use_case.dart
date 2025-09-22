import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import '../../../../core/api_result/result.dart';
import '../../api/models/login/request/login_request.dart';
import '../../api/models/login/response/login_response.dart';

@injectable
class LoginUseCase{
  AuthRepositry _authRepositry;
  LoginUseCase(this._authRepositry);
  Future<Result<LoginResponse>>login(LoginRequest request)async{
    return await _authRepositry.login(request);
  }

}