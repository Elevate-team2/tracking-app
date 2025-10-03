import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/constants/json_serlization_constants.dart';

part 'edit_vehicle_request.g.dart';

@JsonSerializable()
class EditVehicleRequest {
  @JsonKey(name: JsonSerlizationConstants.vehicleType)
  final String? vehicleType;
  @JsonKey(name: JsonSerlizationConstants.vehicleNumber)
  final String? vehicleNumber;
  @JsonKey(name: JsonSerlizationConstants.vehicleLicense)
  final String? vehicleLicense;

  EditVehicleRequest ({
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });

  factory EditVehicleRequest.fromJson(Map<String, dynamic> json) {
    return _$EditVehicleRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditVehicleRequestToJson(this);
  }
}


