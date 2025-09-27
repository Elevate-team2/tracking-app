import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'reset_password_response.g.dart';
@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: JsonSerlizationConstants.message)
  final String? message;
  @JsonKey(name: JsonSerlizationConstants.token)
  final String? token;
  @JsonKey(name: JsonSerlizationConstants.error)
  final String? error;

  ResetPasswordResponse ({
    this.message,
    this.token,
    this.error,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseToJson(this);
  }
}


