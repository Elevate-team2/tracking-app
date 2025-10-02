import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/profile/domain/entity/location_info_entity.dart';

part 'location_info.g.dart';

@JsonSerializable()
class LocationInfo {
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  LocationInfo ({
    this.country,
    this.createdAt,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return _$LocationInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationInfoToJson(this);
  }
  LocationInfoEntity toEntity(){
    return LocationInfoEntity(
      country: country ?? '',
      createdAt: createdAt ?? '',
    );
  }
}


