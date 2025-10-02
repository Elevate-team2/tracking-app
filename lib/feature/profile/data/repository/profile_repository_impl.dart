// lib/feature/profile/data/repository/profile_repository_impl.dart
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/core/api_result/result.dart';
import '../data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request) async {
   return await _remoteDataSource.changePassword(request);
  }
}
