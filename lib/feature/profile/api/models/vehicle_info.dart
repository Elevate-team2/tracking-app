import 'package:json_annotation/json_annotation.dart';

part 'vehicle_info.g.dart';

@JsonSerializable()
class VehicleInfo {
  @JsonKey(name: "vehicleType")
  final String? vehicleType;
  @JsonKey(name: "vehicleNumber")
  final String? vehicleNumber;
  @JsonKey(name: "vehicleLicense")
  final String? vehicleLicense;

  VehicleInfo ({
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) {
    return _$VehicleInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehicleInfoToJson(this);
  }
}


