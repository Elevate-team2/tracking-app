import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/core/constants/end_points_constants.dart';
import 'package:tracking_app/feature/profile/api/models/driver_contact_info.dart';
import 'package:tracking_app/feature/profile/api/models/driver_info.dart';
import 'package:tracking_app/feature/profile/api/models/vehicle_info.dart';

part 'profile_api_services.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class ProfileApiServices {
  @factoryMethod
  factory ProfileApiServices(Dio dio) = _ProfileApiServices;
  @GET(EndPointsConstants.getprofileEndPoint)
  Future<DriverInfo>getDriverInfo();
  Future<DriverContactInfo>getDriverContactInfo();
  Future<VehicleInfo>getVehicleInfo();

}
