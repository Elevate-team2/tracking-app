import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import '../../../../core/constants/end_points_constants.dart';
part 'auth_api_services.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class AuthApiServices{
  @factoryMethod
  factory AuthApiServices(Dio dio)=_AuthApiServices;

  @POST(EndPointsConstants.signinEndPoint)
  Future<LoginResponse>login(@Body()LoginRequest request);
}
