import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_result/result.dart';
import '../../../data/data_source/remote/auth_remote_data_source.dart';
import '../../../data/models/driver_model.dart';
import '../../../domain/entity/country_entity.dart';
import '../../../domain/entity/driver_entity.dart';
import '../../../domain/entity/timezone.dart';

@injectable
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AssetBundle assetBundle;

  AuthRemoteDataSourceImpl(this.assetBundle, MockAuthApiServices mockApi);

  @override
  Future<Result<(Driver, String)>> applyDriver(Map<String, dynamic> body) async {
    try {
      final response = await assetBundle.loadString("assets/json/driver_response.json");
      final data = jsonDecode(response) as Map<String, dynamic>;
      final driverJson = data['driver'] as Map<String, dynamic>;
      final driverModel = DriverModel.fromJson(driverJson);
      final driverEntity = driverModel.toEntity();
      final token = data['token'] as String? ?? '';

      return SuccessResult((driverEntity, token));
    } catch (e) {
      return FailedResult("Failed to apply driver", e.toString());
    }
  }

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
      return FailedResult("Error", e.toString());
    }
  }
}

class MockAuthApiServices {
}