import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/client/profile_api_services.dart';
import 'package:tracking_app/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_contact_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/vehicle_info_entity.dart';

import '../../models/driver_contact_info.dart';
import '../../models/driver_info.dart';
import '../../models/vehicle_info.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  ProfileApiServices profileApiServices;
  @factoryMethod
  ProfileRemoteDataSourceImpl({ required this.profileApiServices});
  @override
  Future<Result<DriverContactInfoEntity>> getDriverContactInfo() async{
    try{
      var responce= await profileApiServices.getDriverContactInfo();
      var entity= await responce.toEntity();
      return SucessResult(entity);


    }
    catch(e){
      return FailedResult(e.toString());
    }

  }

  @override
  Future<Result<DriverInfoEntity>> getDriverInfo() async{
    try{
      var responcedriverinfo= profileApiServices.getDriverInfo();
      var entity= (await responcedriverinfo).toEntity();
      return SucessResult(await entity);
    }
    catch(e){
      return FailedResult(e.toString());
    }
  }

  @override
  Future<Result<VehicleInfoEntity>> getVehicleInfo() async{
   try{
     var responce=await profileApiServices.getVehicleInfo();
     var entity=responce.toEntity();
     return SucessResult(entity);
   }
   catch(e){
     return FailedResult(e.toString());
   }
  }
  // final ProfileApiServices _profileApiServices;
  // ProfileRemoteDataSourceImpl(this._profileApiServices);

}