import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/order_item_entity.dart';
import 'package:tracking_app/feature/home/api/models/remote_product_model.dart';

part 'remote_order_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoteOrderItemModel {
  @JsonKey(name: "product")
  RemoteProductModel? product;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "_id")
  String? id;

  RemoteOrderItemModel({this.product, this.price, this.quantity, this.id});

  factory RemoteOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderItemModelToJson(this);

   OrderItemEntity toEntity(
   
  ) {
    return OrderItemEntity(
      id: id ?? '',
      price: price ?? 0,
      quantity: quantity ?? 0,
      product: RemoteProductModel.toEntity(product),
    );
  }

 
  factory RemoteOrderItemModel.fromEntity(OrderItemEntity entity) {
    return RemoteOrderItemModel(
      id: entity.id,
      price: entity.price,
      quantity: entity.quantity,
      product: RemoteProductModel.fromEntity(entity.product),
    );
  }
}
