import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'auth_info.g.dart';

@JsonSerializable()
class AuthenticationInfo {
  @JsonKey(name: JsonSerlizationConstants.password)
  final String? password;
  @JsonKey(name: JsonSerlizationConstants.rePassword)
  final String? rePassword;

  AuthenticationInfo({
    this.password,
    this.rePassword,
  });

  factory AuthenticationInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationInfoToJson(this);
}