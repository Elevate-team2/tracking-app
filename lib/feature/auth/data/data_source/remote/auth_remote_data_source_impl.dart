import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/data/models/driver_model.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/timezone.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AssetBundle assetBundle;
  final AuthApiServices api;

  AuthRemoteDataSourceImpl(this.assetBundle, this.api);

  @override
  Future<Result<List<CountryEntity>>> getCountries() async {
    try {
      final response = await assetBundle.loadString("assets/json/country.json");
      final data = jsonDecode(response) as List<dynamic>;
      final countries = data.map((json) {
        final timezone = json["timezones"] as List<dynamic>;
        final times = timezone
            .map((e) => Timezone(
          zoneName: e["zoneName"],
          gmtOffset: e["gmtOffset"],
          gmtOffsetName: e["gmtOffsetName"],
          abbreviation: e["abbreviation"],
          tzName: e["tzName"],
        ))
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

      return SuccessResult(countries);
    } catch (e) {
      return FailedResult(
        e.toString(),
        e is DioException ? e.message ?? '' : '',
      );
    }
  }

  @override
  Future<Result<(Driver, String)>> applyDriver(Map<String, dynamic> body) async {
    try {
      final authResponse = await api.applyDriver(body);
      final driverJson = authResponse.driver.toJson() ;
      final driverModel = DriverModel.fromJson(driverJson);
      final driverEntity = driverModel.toEntity();
      final token = authResponse.token ;
      return SuccessResult((driverEntity, token));
    } catch (e) {
      return FailedResult(
        e.toString(),
        e is DioException ? e.message ?? '' : '',
      );
    }
  }
}
