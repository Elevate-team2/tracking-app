import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/home/api/models/metadata_model.dart';
import 'package:tracking_app/feature/order/api/models/remote_order_model.dart';
import 'package:tracking_app/feature/order/domain/entity/order_driver_entity.dart';

part 'order_response_model.g.dart';


@JsonSerializable()
class OrderResponseModel {
  @JsonKey(name: JsonSerlizationConstants.message)
  String? message;

  @JsonKey(name: JsonSerlizationConstants.metadata)
  MetadataModel? metadata;

  @JsonKey(name: JsonSerlizationConstants.orders) 
  List<RemoteOrderModel>? orders;

  OrderResponseModel({this.message, this.metadata, this.orders});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);

  OrderDriverEntity toEntity() {
    return OrderDriverEntity(
      orders: orders!.map((order) => order.toEntity()).toList(),
    );
  }

}
