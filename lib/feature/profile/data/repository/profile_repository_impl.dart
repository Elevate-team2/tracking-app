// lib/feature/profile/data/repository/profile_repository_impl.dart
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/core/api_result/result.dart';
import '../data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request) async {
    try {
      final response = await remoteDataSource.changePassword(request);
      return SucessResult(response);
    } catch (e) {
      return FailedResult(e.toString());
    }
  }
}
