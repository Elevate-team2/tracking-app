import 'package:tracking_app/feature/profile/domain/entity/driver_contact_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/vehicle_info_entity.dart';

import '../../../../../core/api_result/result.dart';
import '../../../api/models/driver_contact_info.dart';
import '../../../api/models/driver_info.dart';
import '../../../api/models/vehicle_info.dart';

abstract interface class ProfileRemoteDataSource {
  Future<Result<DriverInfoEntity>>getDriverInfo();
  Future<Result<DriverContactInfoEntity>>getDriverContactInfo();
  Future<Result<VehicleInfoEntity>>getVehicleInfo();
}