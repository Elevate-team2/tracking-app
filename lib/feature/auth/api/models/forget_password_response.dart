import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  @JsonKey(name: JsonSerlizationConstants.message)
  final String? message;
  @JsonKey(name: JsonSerlizationConstants.info)
  final String? info;
  @JsonKey(name: JsonSerlizationConstants.error)
  final String? error;

  ForgetPasswordResponse({this.message, this.info, this.error});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordResponseToJson(this);
  }
}
