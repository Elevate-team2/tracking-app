import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/client/profile_api_services.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_response.dart';
import 'package:tracking_app/feature/profile/data/data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
   final  ProfileApiServices _apiServices;
  const  ProfileRemoteDataSourceImpl(this._apiServices);

  @override
  Future<Result<ChangePasswordResponse>> changePassword(ChangePasswordRequest request)async {
   try{
     final response=await _apiServices.changePassword(request);
     return SucessResult(response);
   }catch(error){
    if(error is DioException){
      return FailedResult(ServerFailure.fromDioError(error).errorMessage);
    } else{
      return FailedResult(error.toString());

    }
   }
  }

  }


