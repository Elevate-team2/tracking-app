import 'dart:io';

import '../../../../core/api_result/result.dart';
import '../../api/models/request/apply_request.dart';
import '../entity/country_entity.dart';
import '../entity/driver_entity.dart';
import '../entity/vehicles_entity.dart';

abstract interface class AuthRepositry{

  Future<Result<List<CountryEntity>>>getCountries();
  Future<Result<List<VehicleEntity>>>getAllVehicles();
  Future<Result<DriverEntity>> apply(ApplyRequest request ,
     );
}