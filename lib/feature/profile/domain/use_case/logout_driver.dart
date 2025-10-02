import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@injectable
class LogoutDriverUseCase {
  final ProfileRepository _profileRepository;
  LogoutDriverUseCase(this._profileRepository);

  Future<Result<void>> logoutDriver() async {
    return await _profileRepository.logoutDriver();
  }


}
