import 'package:json_annotation/json_annotation.dart';

part 'driver_contact_info.g.dart';

@JsonSerializable()
class DriverContactInfo {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;

  DriverContactInfo ({
    this.email,
    this.phone,
  });

  factory DriverContactInfo.fromJson(Map<String, dynamic> json) {
    return _$DriverContactInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverContactInfoToJson(this);
  }
}


