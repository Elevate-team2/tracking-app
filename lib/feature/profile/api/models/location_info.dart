import 'package:json_annotation/json_annotation.dart';

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
}


