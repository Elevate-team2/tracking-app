import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: JsonSerlizationConstants.firstName)
  final String? firstName;

  @JsonKey(name: JsonSerlizationConstants.lastName)
  final String? lastName;

  @JsonKey(name: JsonSerlizationConstants.email)
  final String? email;

  @JsonKey(name: JsonSerlizationConstants.phone)
  final String? phone;

  @JsonKey(name: JsonSerlizationConstants.vehicleType)
  final String? vehicleType;

  @JsonKey(name: JsonSerlizationConstants.vehicleNumber)
  final String? vehicleNumber;

  @JsonKey(name: JsonSerlizationConstants.vehicleLicense)
  final String? vehicleLicense;

  EditProfileRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
