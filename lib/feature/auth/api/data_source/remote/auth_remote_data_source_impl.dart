import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';

import '../../../data/data_source/remote/auth_remote_data_source.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
 final AuthApiServices _apiServices;
 const AuthRemoteDataSourceImpl(this._apiServices);
  @override
  Future<Result<LoginResponse>> login(LoginRequest request)async {
try{
  final response=await _apiServices.login(request);
  return SucessResult(response);
}catch(error){
  if(error is DioException){
return FailedResult(ServerFailure.fromDioError(error).errorMessage);
  }else{
    return FailedResult(error.toString());
  }
}
  }
  
}
