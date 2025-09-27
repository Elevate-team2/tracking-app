import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'apply_request.g.dart';

@JsonSerializable()
class ApplyRequest {
  @JsonKey(name: JsonSerlizationConstants.country)
  final String? country;
  @JsonKey(name: JsonSerlizationConstants.firstName)
  final String? firstName;
  @JsonKey(name: JsonSerlizationConstants.lastName)
  final String? lastName;
  @JsonKey(name: JsonSerlizationConstants.vehicleType)
  final String? vehicleType;
  @JsonKey(name: JsonSerlizationConstants.vehicleNumber)
  final String? vehicleNumber;
  @JsonKey(name: JsonSerlizationConstants.nid)
  final String? NID;
  @JsonKey(name: JsonSerlizationConstants.email)
  final String? email;
  @JsonKey(name: JsonSerlizationConstants.nidImg, ignore: true)
  final File? NIDImg;
  @JsonKey(name: JsonSerlizationConstants.vehicleLicense, ignore: true)
  final File? vehicleLicense;
  @JsonKey(name: JsonSerlizationConstants.password)
  final String? password;
  @JsonKey(name: JsonSerlizationConstants.rePassword)
  final String? rePassword;
  @JsonKey(name: JsonSerlizationConstants.gender)
  final String? gender;
  @JsonKey(name: JsonSerlizationConstants.phone)
  final String? phone;

  ApplyRequest({
    this.country,
    this.firstName,
    this.NIDImg,
    this.vehicleLicense,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.NID,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.phone,
  });

  factory ApplyRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyRequestToJson(this);
}
