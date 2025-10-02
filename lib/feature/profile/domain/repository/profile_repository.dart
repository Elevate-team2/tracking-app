import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/core/api_result/result.dart';

abstract interface class ProfileRepository {
  Future<Result<ChangePasswordResponse>>
  changePassword(ChangePasswordRequest request);
}
