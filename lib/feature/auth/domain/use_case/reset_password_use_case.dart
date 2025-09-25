import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

@Injectable()
class ResetPasswordUseCase {
  final AuthRepositry _authRepositry;
  ResetPasswordUseCase(this._authRepositry);

  Future<Result<String>> call(String email, String newPassword)async{
    return await _authRepositry.resetPassword(email, newPassword);
  }
}