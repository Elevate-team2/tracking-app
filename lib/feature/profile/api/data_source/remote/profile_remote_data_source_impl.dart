import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/profile/api/client/profile_api_services.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileApiServices profileApiServices;

  ProfileRemoteDataSourceImpl(this.profileApiServices);

  @override
  Future<Result<DriverEntity>> getLoggedDriver() async {
    try {
      final driverRespnse = await profileApiServices.getLoggedDriver();

      final driverEntity = driverRespnse.driver!.toEntity();
   
      return SucessResult(driverEntity);
    } catch (e) {
      return FailedResult(e.toString());
    }
  }
  
  @override
  Future<Result<void>> logoutDriver()async {
   try {
     await profileApiServices.logoutDriver();

      return SucessResult(null);
    } catch (e) {
      return FailedResult(e.toString());
    }
  
  
  }

 
}
