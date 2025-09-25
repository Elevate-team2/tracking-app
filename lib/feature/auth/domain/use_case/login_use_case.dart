import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import '../../../../core/api_result/result.dart';
import '../../api/models/login/request/login_request.dart';
import '../../api/models/login/response/login_response.dart';

@Injectable()
class LoginUseCase{
  final AuthRepositry _authRepo;
const  LoginUseCase(this._authRepo);
  Future<Result<LoginResponse>>login(LoginRequest request)async{
    return await _authRepo.login(request);
  }

}