import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_info_entity.dart';

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
  DriverInfoEntity toEntity(){
    return DriverInfoEntity(
      role: role ?? '',
      Id: Id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ??'',
      gender: gender ?? '',
      photo: photo ?? '',
    );
  }
}


