  import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

import '../../domain/repositry/auth_repositry.dart';
@Injectable(as: AuthRepositry)
class AuthRepositryImpl implements
    AuthRepositry{
 final AuthRemoteDataSource _authRemoteDataSource;
  const AuthRepositryImpl(this._authRemoteDataSource);
  @override
  Future<Result<List<VehicleEntity>>> getAllVehicles()async {
    return await _authRemoteDataSource.getAllVehicles();
  }

  @override
  Future<Result<List<CountryEntity>>> getCountries()async {
    return await _authRemoteDataSource.getCountries();

  }

}