import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/api/models/product_model.dart';
import 'package:tracking_app/feature/home/domain/entity/order_item_entity.dart';
part 'order_item_model.g.dart';
@JsonSerializable()
class OrderItemModel {
    @JsonKey(name: "product")
    ProductModel? product;
    @JsonKey(name: "price")
    int? price;
    @JsonKey(name: "quantity")
    int? quantity;
    @JsonKey(name: "_id")
    String? id;

    OrderItemModel({
        this.product,
        this.price,
        this.quantity,
        this.id,
    });

    factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

    Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

    static OrderItemEntity orderItemModelToEntity(OrderItemModel? model) {
  return OrderItemEntity(
    id: model?.id ?? '',
    price: model?.price ?? 0,
    quantity: model?.quantity ?? 0,
    product: ProductModel.productModelToEntity(model?.product), 
  );
}
}
