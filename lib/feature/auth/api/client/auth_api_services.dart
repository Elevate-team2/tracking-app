import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password/forget_password_response.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password/reset_password_response.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/api/models/apply/response/apply_response/all_vehicles_response.dart';
import 'package:tracking_app/feature/auth/api/models/apply/response/apply_response/apply_response.dart';
import '../../../../core/constants/end_points_constants.dart';
part 'auth_api_services.g.dart';
@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class AuthApiServices {
  @factoryMethod
  factory AuthApiServices(Dio dio) = _AuthApiServices;

  @POST(EndPointsConstants.signinEndPoint)
  Future<LoginResponse>login(@Body()LoginRequest request);
  
  @POST(EndPointsConstants.forgetPass)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() Map<String, dynamic> body,
      );

  @POST(EndPointsConstants.verifyCode)
  Future<Map<String, String>> verifyResetCode(
      @Body() Map<String, String> body);

  @PUT(EndPointsConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
      @Body() Map<String, dynamic> body);

@GET(EndPointsConstants.allVehicles)
  Future<AllVehiclesResponse>getAllVehicles();

  @POST(EndPointsConstants.applyEndPoint)
  @MultiPart()
  Future<ApplyResponse> apply(@Body() FormData body);
}
