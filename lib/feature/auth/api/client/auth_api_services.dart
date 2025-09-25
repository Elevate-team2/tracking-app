import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/feature/auth/api/models/forget_password_response.dart';
import 'package:tracking_app/feature/auth/api/models/reset_password_response.dart';
import '../../../../core/constants/end_points_constants.dart';
part 'auth_api_services.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class AuthApiServices {
  @factoryMethod
  factory AuthApiServices(Dio dio) = _AuthApiServices;
  
  @POST(EndPointsConstants.forgetPass)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() Map<String, dynamic> body,
      );

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

}
