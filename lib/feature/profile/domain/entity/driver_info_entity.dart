import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DriverInfoEntity extends Equatable {
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

  const DriverInfoEntity ({
    this.role,
    this.Id,
    this.firstName,
    this.lastName,
    this.gender,
    this.photo,
  });

  /// The properties used to determine if two [DriverInfo] instances are equal.
  @override
  List<Object?> get props => [
    role,
    Id,
    firstName,
    lastName,
    gender,
    photo,
  ];
}