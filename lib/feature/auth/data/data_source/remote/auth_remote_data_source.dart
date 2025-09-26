import 'dart:io';

import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/request/apply_request.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

import '../../../domain/entity/driver_entity.dart';

abstract interface class AuthRemoteDataSource{

  Future<Result<List<CountryEntity>>>getCountries();
  Future<Result<List<VehicleEntity>>>getAllVehicles();
  Future<Result<DriverEntity>> apply(ApplyRequest request);
}