// To parse this JSON data, do
//
//     final updateStateResponseModel = updateStateResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/home/api/models/update_state_order_model.dart';
import 'dart:convert';


part 'update_state_response_model.g.dart';

UpdateStateResponseModel updateStateResponseModelFromJson(String str) =>
    UpdateStateResponseModel.fromJson(json.decode(str));

String updateStateResponseModelToJson(UpdateStateResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UpdateStateResponseModel {
  @JsonKey(name: JsonSerlizationConstants.message)
  String message;
  @JsonKey(name: JsonSerlizationConstants.orders)
  UpdateStateOrderModel orders;

  UpdateStateResponseModel({required this.message, required this.orders});

  factory UpdateStateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateStateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStateResponseModelToJson(this);
  
}

