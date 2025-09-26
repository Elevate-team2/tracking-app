import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';

import '../../../../core/api_result/result.dart';
import '../../api/models/request/apply_request.dart';
import '../entity/driver_entity.dart';

@injectable
class ApplyUseCase{
  final AuthRepositry _authRepositry;
  const ApplyUseCase(this._authRepositry);
  Future<Result<DriverEntity>> apply(ApplyRequest request ,
      File nid,
      File vehiclesLicense,)async{
    return await _authRepositry.apply(request,nid,vehiclesLicense);
  }
}