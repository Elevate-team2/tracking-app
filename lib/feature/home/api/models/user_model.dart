import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
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

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserEntity userModelToEntity(UserModel? model) {
    if (model == null) {
      return UserEntity(
        id: 'fakeUserId123',
        firstName: 'John',
        lastName: 'Doe',
        email: 'johndoe@example.com',
        gender: 'Male',
        phone: '01000000000',
        photo: '',
      );
    }

    return UserEntity(
      id: model.id ?? '',
      firstName: model.firstName ?? '',
      lastName: model.lastName ?? '',
      email: model.email ?? '',
      gender: model.gender ?? '',
      phone: model.phone ?? '',
      photo: model.photo ?? '',
    );
  }
}
