import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'location_info.g.dart';

@JsonSerializable()
class LocationInfo {
  @JsonKey(name: JsonSerlizationConstants.country)
  final String? country;

  LocationInfo({
    this.country,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);
}