// To parse this JSON data, do
//
//     final getLoggedUserResponse = getLoggedUserResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'package:tracking_app/feature/auth/api/models/apply/response/apply_response/apply_response.dart';

part 'get_logged_user_response.g.dart';


@JsonSerializable()
class GetLoggedUserResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "driver")
    Driver? driver;

    GetLoggedUserResponse({
        this.message,
        this.driver,
    });

    factory GetLoggedUserResponse.fromJson(Map<String, dynamic> json) => _$GetLoggedUserResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetLoggedUserResponseToJson(this);
}

