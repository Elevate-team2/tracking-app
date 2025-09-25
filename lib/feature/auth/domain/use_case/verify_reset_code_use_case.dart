import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepositry _authRepositry;
  VerifyResetCodeUseCase(this._authRepositry);

  Future<Result<String>> call(String code)async{
    return await _authRepositry.verifyResetCode(code);
  }
}