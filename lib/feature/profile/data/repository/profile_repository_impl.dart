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

  // @override
  // Future<Result<DriverContactInfoEntity>> getDriverContactInfo() {
  //   return profileRemoteDataSource.getDriverContactInfo();

  // }

  // @override
  // Future<Result<DriverInfoEntity>> getDriverInfo() {
  //   return profileRemoteDataSource.getDriverInfo();
  // }

  // @override
  // Future<Result<VehicleInfoEntity>> getVehicleInfo() {
  //   return profileRemoteDataSource.getVehicleInfo();
  // }

  @override
  Future<Result<DriverEntity>> getLoggedDriver() async {
    return await profileRemoteDataSource.getLoggedDriver();
  }
}
