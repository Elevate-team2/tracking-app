import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/home/api/models/metadata_model.dart';
import 'package:tracking_app/feature/home/api/models/remote_order_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: JsonSerlizationConstants.message)
  String? message;

  @JsonKey(name: JsonSerlizationConstants.metadata)
  MetadataModel? metadata;

  @JsonKey(name: JsonSerlizationConstants.orders) 
  List<RemoteOrderModel>? orders;

  OrderResponse({this.message, this.metadata, this.orders});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
