
import 'package:tracking_app/core/api_result/result.dart';

import '../../../api/models/change_password_request.dart';
import '../../../api/models/change_password_response.dart';

abstract interface class ProfileRemoteDataSource {
  Future<Result<ChangePasswordResponse>>
  changePassword(ChangePasswordRequest request);
}

