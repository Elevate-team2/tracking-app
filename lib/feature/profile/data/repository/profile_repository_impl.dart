import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

import '../data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository{
  // final ProfileRemoteDataSource _profileRemoteDataSource;
  // ProfileRepositoryImpl(this._profileRemoteDataSource);
  final ProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryImpl(this.remoteDataSource);
  @override
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) {
    return remoteDataSource.changePassword(request);
  }
}