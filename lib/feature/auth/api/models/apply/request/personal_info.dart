import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'personal_info.g.dart';

@JsonSerializable()
class PersonalInfo {
  @JsonKey(name: JsonSerlizationConstants.firstName)
  final String? firstName;
  @JsonKey(name: JsonSerlizationConstants.lastName)
  final String? lastName;
  @JsonKey(name: JsonSerlizationConstants.gender)
  final String? gender;
  @JsonKey(name: JsonSerlizationConstants.phone)
  final String? phone;
  @JsonKey(name: JsonSerlizationConstants.email)
  final String? email;
  @JsonKey(name: JsonSerlizationConstants.nid)
  final String? nid;
  @JsonKey(
    name: JsonSerlizationConstants.nidImg,
    includeToJson: false,
    includeFromJson: false,
  )
  final File? nidimg;

  PersonalInfo({
    this.firstName,
    this.lastName,
    this.gender,
    this.phone,
    this.email,
    this.nid,
    this.nidimg,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}