import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/core/constants/end_points_constants.dart';

import '../models/change_password_request.dart';
import '../models/change_password_response.dart';

part 'profile_api_services.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class ProfileApiServices {
  @factoryMethod
  factory ProfileApiServices(Dio dio) = _ProfileApiServices;

  @PATCH(EndPointsConstants.changePassword)
  Future<ChangePasswordResponse> changePassword(
      @Body() ChangePasswordRequest request,
      );

}
