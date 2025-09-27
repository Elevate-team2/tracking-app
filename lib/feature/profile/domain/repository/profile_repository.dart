import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';

abstract interface class ProfileRepository {
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request);
}