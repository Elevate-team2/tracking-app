import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/user_entity.dart';

part 'remote_user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoteUserModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "passwordChangedAt")
  String? passwordChangedAt;
  @JsonKey(name: "passwordResetCode")
  String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
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
