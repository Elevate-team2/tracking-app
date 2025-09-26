import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/models/response/apply_response/apply_response.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

import '../../../data/data_source/remote/auth_remote_data_source.dart';
import '../../../domain/entity/driver_entity.dart';
import '../../../domain/entity/time_zone.dart';
import '../../models/request/apply_request.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements
    AuthRemoteDataSource{
  final AuthApiServices _authApiServices;
  const AuthRemoteDataSourceImpl(this._authApiServices);
  @override
  Future<Result<List<VehicleEntity>>> getAllVehicles()async {
try{
  final response=await _authApiServices.getAllVehicles();
  final vehicles=response.vehicles?.map((e)=>e.toEntity()).toList()??[];
  return SucessResult(vehicles);
}catch(error){
  if(error is DioException){
    return FailedResult(ServerFailure.fromDioError(error).errorMessage);
  }else{
    return FailedResult(error.toString());
  }
}
  }

  @override
  Future<Result<List<CountryEntity>>> getCountries()
  async {
    try {
      final response = await
      rootBundle.loadString("assets/json/country.json");
      final data = jsonDecode(response) as List<dynamic>;

      final countries = data.map((json) {
        final timezonesJson = json["timezones"] as List<dynamic>;
        final times = timezonesJson
            .map(
              (e) => Timezone(
            zoneName: e["zoneName"],
            gmtOffset: e["gmtOffset"],
            gmtOffsetName: e["gmtOffsetName"],
            abbreviation: e["abbreviation"],
            tzName: e["tzName"],
          ),
        )
            .toList();
        return CountryEntity(
          isoCode: json["isoCode"],
          name: json["name"],
          phoneCode: json["phoneCode"],
          flag: json["flag"],
          currency: json["currency"],
          latitude: json["latitude"],
          longitude: json["longitude"],
          timezones: times,
        );
      }).toList();
      return SucessResult(countries);
    } catch (error) {
      return FailedResult(error.toString());
    }
  }

  @override
  Future<Result<DriverEntity>> apply(ApplyRequest request) async{
   try{
     final response=await _authApiServices.apply(request);
  final   driver=response.driver!.toEntity();
  return SucessResult(driver);
   }catch(error){
     if(error is DioException){
       return FailedResult(ServerFailure.fromDioError(error).errorMessage);
     }
     else{
       return FailedResult(error.toString());
     }
   }
  }
  }


