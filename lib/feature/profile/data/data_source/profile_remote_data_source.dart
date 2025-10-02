import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

import '../../../../core/api_result/result.dart';

abstract interface class ProfileRemoteDataSource {

  Future<Result<DriverEntity>> getLoggedDriver();

   Future<Result<void>> logoutDriver();
}
