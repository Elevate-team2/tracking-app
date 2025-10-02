import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import '../../domain/entity/location_info_entity.dart';

part 'location_info.g.dart';

@JsonSerializable()
class LocationInfo {
  @JsonKey(name: JsonSerlizationConstants.country)
  final String? country;
  @JsonKey(name: JsonSerlizationConstants.createdAt)
  final String? createdAt;
  LocationInfo({this.country, this.createdAt});

  factory LocationInfo.fromJson(Map<String, dynamic> json) => _$LocationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);

  LocationInfoEntity toEntity() {
    return LocationInfoEntity(
      country: country ?? "",
      createdAt: createdAt ?? "",
    );
  }
}
