import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/api/models/metadata_model.dart';
import 'package:tracking_app/feature/home/api/models/order_model.dart';

part 'pending_response_model.g.dart';

@JsonSerializable()
class PendingOrdersResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  MetadataModel? metadata;
  @JsonKey(name: "orders")
  List<OrderModel>? orders;

  PendingOrdersResponse({this.message, this.metadata, this.orders});

  factory PendingOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PendingOrdersResponseToJson(this);
}
