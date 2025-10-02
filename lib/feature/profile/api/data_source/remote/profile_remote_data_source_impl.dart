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
      final driver = driverRespnse.driver!;
      print("data came yaay");
     print("Driver ID: ${driver.id}");
  print("Name: ${driver.firstName} ${driver.lastName}");
  print("Country: ${driver.country}");
  print("Gender: ${driver.gender}");
  print("Email: ${driver.email}");
  print("Phone: ${driver.phone}");
  print("Role: ${driver.role}");
  print("Photo URL: ${driver.photo}");
  print("Vehicle Type: ${driver.vehicleType}");
  print("Vehicle Number: ${driver.vehicleNumber}");
  print("Vehicle License URL: ${driver.vehicleLicense}");
  print("NID: ${driver.nId}");
  print("NID Image URL: ${driver.nIdImg}");
  print("Created At: ${driver.createdAt}");

      final driverEntity = driverRespnse.driver!.toEntity();
       print("data came yaay2");
      return SucessResult(driverEntity);
    } catch (e) {
      return FailedResult(e.toString());
    }
  }

  //@factoryMethod
  // ProfileRemoteDataSourceImpl({ required this.profileApiServices});
  // @override
  // Future<Result<DriverContactInfoEntity>> getDriverContactInfo() async{
  //   try{
  //     var responce= await profileApiServices.getDriverContactInfo();
  //     var entity= await responce.toEntity();
  //     return SucessResult(entity);

  //   }
  //   catch(e){
  //     return FailedResult(e.toString());
  //   }

  // }

  // @override
  // Future<Result<DriverInfoEntity>> getDriverInfo() async{
  //   try{
  //     var responcedriverinfo= profileApiServices.getDriverInfo();
  //     var entity= (await responcedriverinfo).toEntity();
  //     return SucessResult(await entity);
  //   }
  //   catch(e){
  //     return FailedResult(e.toString());
  //   }
  // }

  // @override
  // Future<Result<VehicleInfoEntity>> getVehicleInfo() async{
  //  try{
  //    var responce=await profileApiServices.getVehicleInfo();
  //    var entity=responce.toEntity();
  //    return SucessResult(entity);
  //  }
  //  catch(e){
  //    return FailedResult(e.toString());
  //  }
  // }
  // // final ProfileApiServices _profileApiServices;
  // // ProfileRemoteDataSourceImpl(this._profileApiServices);
}
