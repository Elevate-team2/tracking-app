import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String message;
  final Driver driver;
  final String token;

  AuthResponse({
    required this.message,
    required this.driver,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class Driver {
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String nid;
  final String nidImg;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String role;

  @JsonKey(name: "_id")
  final String id;

  final String createdAt;

  Driver({
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.nid,
    required this.nidImg,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.role,
    required this.id,
    required this.createdAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) =>
      _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
