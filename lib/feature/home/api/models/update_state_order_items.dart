import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/start_order_item_entity.dart';

part 'update_state_order_items.g.dart';

@JsonSerializable()
class UpdateStateOrderItems {
  @JsonKey(name: "product")
  String product;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "_id")
  String id;

  UpdateStateOrderItems({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory UpdateStateOrderItems.fromJson(Map<String, dynamic> json) =>
      _$UpdateStateOrderItemsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStateOrderItemsToJson(this);

  StartOrderItemEntity toEntity() {
    return StartOrderItemEntity(
      product: product,
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}
