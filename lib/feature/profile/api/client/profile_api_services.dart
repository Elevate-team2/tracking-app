import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/core/constants/end_points_constants.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/request/edit_profile_request.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/response/edit_profile_response.dart';

part 'profile_api_services.g.dart';


@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class ProfileApiServices {
  @factoryMethod
  factory ProfileApiServices(Dio dio) = _ProfileApiServices;

  @PUT(EndPointsConstants.uploadDriverPhoto)
  @MultiPart()
  Future<String> uploadDriverPhoto(@Part(name: "photo") MultipartFile photo,);
  
  @PUT(EndPointsConstants.editDriverProfile)
  Future<EditProfileResponse> editProfile(@Body() EditProfileRequest request);
}
