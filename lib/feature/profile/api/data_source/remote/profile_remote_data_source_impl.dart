import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/data/data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  @override
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
  // final ProfileApiServices _profileApiServices;
  // ProfileRemoteDataSourceImpl(this._profileApiServices);

}
