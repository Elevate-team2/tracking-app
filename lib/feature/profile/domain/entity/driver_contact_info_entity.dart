import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class DriverContactInfoEntity extends Equatable {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;

  const DriverContactInfoEntity ({
    this.email,
    this.phone,
  });

  /// The properties used to determine if two [DriverContactInfo] instances are equal.
  @override
  List<Object?> get props => [email, phone];
}