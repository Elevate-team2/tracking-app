import '../../../api/client/profile_api_services.dart';
import '../../../api/models/change_password_request.dart';
import '../../../api/models/change_password_response.dart';
import 'package:injectable/injectable.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request);
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiServices api;

  ProfileRemoteDataSourceImpl(this.api);

  @override
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) {
    return api.changePassword(request);
  }
}
