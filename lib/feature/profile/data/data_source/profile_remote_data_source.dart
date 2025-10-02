import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

import '../../../../core/api_result/result.dart';

abstract interface class ProfileRemoteDataSource {
  // Future<Result<DriverInfoEntity>>getDriverInfo();
  // Future<Result<DriverContactInfoEntity>>getDriverContactInfo();
  // Future<Result<VehicleInfoEntity>>getVehicleInfo();

  Future<Result<DriverEntity>> getLoggedDriver();
}
