import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

@Injectable()
class ForgetPasswordUseCase {
  final AuthRepositry _authRepositry;
  ForgetPasswordUseCase(this._authRepositry);

  Future<Result<String>> call(String email)async{
   return await _authRepositry.forgetPassword(email);
  }
}