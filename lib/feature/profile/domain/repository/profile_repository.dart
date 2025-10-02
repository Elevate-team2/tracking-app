import 'package:tracking_app/core/api_result/result.dart';

import '../entity/driver_contact_info_entity.dart';
import '../entity/driver_info_entity.dart';
import '../entity/vehicle_info_entity.dart';

abstract interface class ProfileRepository {
  Future<Result<DriverInfoEntity>>getDriverInfo();
  Future<Result<DriverContactInfoEntity>>getDriverContactInfo();
  Future<Result<VehicleInfoEntity>>getVehicleInfo();
}