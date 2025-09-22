  import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

import '../../domain/repositry/auth_repositry.dart';
  @Injectable(as: AuthRepositry)
class AuthRepositryImpl implements  AuthRepositry{
  AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositryImpl(this._authRemoteDataSource);
  @override
  Future<Result<LoginResponse>> login(LoginRequest request) async{
 return await _authRemoteDataSource.login(request);
  }
}