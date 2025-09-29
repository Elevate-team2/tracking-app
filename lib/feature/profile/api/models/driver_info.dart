import 'package:json_annotation/json_annotation.dart';

part 'driver_info.g.dart';

@JsonSerializable()
class DriverInfo {
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "photo")
  final String? photo;

  DriverInfo ({
    this.role,
    this.Id,
    this.firstName,
    this.lastName,
    this.gender,
    this.photo,
  });

  factory DriverInfo.fromJson(Map<String, dynamic> json) {
    return _$DriverInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverInfoToJson(this);
  }
}

