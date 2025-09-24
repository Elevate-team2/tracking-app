
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<Result<List<CountryEntity>>> getCountries();
  Future<Result<(Driver, String)>> applyDriver(Map<String, dynamic> body);
}