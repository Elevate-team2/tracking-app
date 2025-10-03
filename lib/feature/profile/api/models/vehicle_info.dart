import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import '../../domain/entity/vehicle_info_entity.dart';

part 'vehicle_info.g.dart';

@JsonSerializable()
class VehicleInfo {
  @JsonKey(name: JsonSerlizationConstants.vehicleType)
  final String? vehicleType;
  @JsonKey(name: JsonSerlizationConstants.vehicleNumber)
  final String? vehicleNumber;
  @JsonKey(name: JsonSerlizationConstants.vehicleLicense)
  final String? vehicleLicense;

  VehicleInfo({this.vehicleType, this.vehicleNumber, this.vehicleLicense});

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => _$VehicleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleInfoToJson(this);

  VehicleInfoEntity toEntity() {
    return VehicleInfoEntity(
      vehicleType: vehicleType ?? "",
      vehicleNumber: vehicleNumber ?? "",
      vehicleLicense: vehicleLicense ?? "",
    );
  }
}
