import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/home/domain/entity/user_entity.dart';

part 'remote_user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoteUserModel {
 @JsonKey(name: JsonSerlizationConstants.id)
String? id;

@JsonKey(name: JsonSerlizationConstants.firstName)
String? firstName;

@JsonKey(name: JsonSerlizationConstants.lastName)
String? lastName;

@JsonKey(name: JsonSerlizationConstants.email)
String? email;

@JsonKey(name: JsonSerlizationConstants.gender)
String? gender;

@JsonKey(name: JsonSerlizationConstants.phone)
String? phone;

@JsonKey(name: JsonSerlizationConstants.photo)
String? photo;

@JsonKey(name: JsonSerlizationConstants.passwordChangedAt)
String? passwordChangedAt;

@JsonKey(name: JsonSerlizationConstants.passwordResetCode)
String? passwordResetCode;

@JsonKey(name: JsonSerlizationConstants.passwordResetExpires)
String? passwordResetExpires;

@JsonKey(name: JsonSerlizationConstants.resetCodeVerified)
bool? resetCodeVerified;


  RemoteUserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordChangedAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory RemoteUserModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      gender: gender ?? '',
      phone: phone ?? '',
      photo: photo ?? '',
    );
  }


  factory RemoteUserModel.fromEntity(UserEntity entity) {
    return RemoteUserModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      gender: entity.gender,
      phone: entity.phone,
      photo: entity.photo,
    );
  }
}
