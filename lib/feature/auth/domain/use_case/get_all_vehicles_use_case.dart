import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import '../../../../core/api_result/result.dart';

@injectable
class GetAllVehiclesUseCase{
  final AuthRepositry _authRepositry;
  const GetAllVehiclesUseCase(this._authRepositry);
  Future<Result<List<VehicleEntity>>> getVehicles()
  async {
    return await _authRepositry.getAllVehicles();
  }
}