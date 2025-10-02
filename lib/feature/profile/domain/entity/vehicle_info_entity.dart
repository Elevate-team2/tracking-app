import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class VehicleInfoEntity extends Equatable {
  @JsonKey(name: "vehicleType")
  final String? vehicleType;
  @JsonKey(name: "vehicleNumber")
  final String? vehicleNumber;
  @JsonKey(name: "vehicleLicense")
  final String? vehicleLicense;

  const VehicleInfoEntity ({
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });

  /// The properties used to determine if two [VehicleInfo] instances are equal.
  @override
  List<Object?> get props => [
    vehicleType,
    vehicleNumber,
    vehicleLicense,
  ];
}