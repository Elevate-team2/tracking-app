import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'apply_request.g.dart';

@JsonSerializable()
class ApplyRequest {
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "vehicleType")
  final String? vehicleType;
  @JsonKey(name: "vehicleNumber")
  final String? vehicleNumber;
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "NIDImg",ignore: true)
  final File? NIDImg;
  @JsonKey(name: "vehicleLicense",ignore: true)
  final File? vehicleLicense;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;

  ApplyRequest ({
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

  factory ApplyRequest.fromJson(Map<String, dynamic> json) {
    return _$ApplyRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplyRequestToJson(this);
  }
}


