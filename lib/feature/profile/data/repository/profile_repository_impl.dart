import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRemoteDataSource profileRemoteDataSource;
  @factoryMethod
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Result<DriverEntity>> getLoggedDriver() async {
    return await profileRemoteDataSource.getLoggedDriver();
  }

  @override
  Future<Result<void>> logoutDriver() async {
    return await profileRemoteDataSource.logoutDriver();
  }
}
