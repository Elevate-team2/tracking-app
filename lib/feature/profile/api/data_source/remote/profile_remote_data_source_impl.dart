import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/safe_api_call/safe_api_call.dart';
import 'package:tracking_app/feature/profile/api/client/profile_api_services.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/request/edit_profile_request.dart';
import 'package:tracking_app/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:tracking_app/feature/profile/domain/entity/edit_profile_entity.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiServices _profileApiServices;
  ProfileRemoteDataSourceImpl(this._profileApiServices);

  @override
  Future<Result<String>> uploadDriverPhoto(File photo) async {
    final multipartFile = await MultipartFile.fromFile(photo.path, filename: "driver_photo.jpg");
    return safeApiCall(
          () => _profileApiServices.uploadDriverPhoto(multipartFile),
    );
  }

  @override
  Future<Result<EditProfileEntity>> editProfile(EditProfileRequest request) {
   return safeApiCall(() async {
      final response = await _profileApiServices.editProfile(request);
      return response.toEntity();
    });
  }

}
