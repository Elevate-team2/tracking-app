import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Result<ChangePasswordResponse>> call(ChangePasswordRequest request) {
    return repository.changePassword(request);
  }
}
