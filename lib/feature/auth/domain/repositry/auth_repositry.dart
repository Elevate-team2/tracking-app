import '../../../../core/api_result/result.dart';
import '../entity/country_entity.dart';
import '../entity/vehicles_entity.dart';

abstract interface class AuthRepositry{

  Future<Result<List<CountryEntity>>>getCountries();
  Future<Result<List<VehicleEntity>>>getAllVehicles();
}