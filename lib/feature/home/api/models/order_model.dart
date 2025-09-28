import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/api/models/order_item_model.dart';
import 'package:tracking_app/feature/home/api/models/shipping_address_model.dart';
import 'package:tracking_app/feature/home/api/models/store_model.dart';
import 'package:tracking_app/feature/home/api/models/user_model.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "orderItems")
  List<OrderItemModel>? orderItems;
  @JsonKey(name: "totalPrice")
  int? totalPrice;
  @JsonKey(name: "shippingAddress")
  ShippingAddressModel? shippingAddress;
  @JsonKey(name: "paymentType")
  String? paymentType;
  @JsonKey(name: "isPaid")
  bool? isPaid;
  @JsonKey(name: "paidAt")
  String? paidAt;
  @JsonKey(name: "isDelivered")
  bool? isDelivered;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "orderNumber")
  String? orderNumber;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "store")
  StoreModel? store;

  OrderModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.shippingAddress,
    this.paymentType,
    this.isPaid,
    this.paidAt,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  static OrderEntity orderModelToEntity(OrderModel model) {
    print("came here to convert");
    return OrderEntity(
      id: model.id ?? '',
      user: UserModel.userModelToEntity(model.user),
      orderItems:
          model.orderItems
              ?.map(OrderItemModel.orderItemModelToEntity)
              .toList() ??
          [],
      totalPrice: model.totalPrice ?? 0,
      shippingAddress: ShippingAddressModel.shippingAddressModelToEntity(
        model.shippingAddress,
      ),
      paymentType: model.paymentType ?? '',
      isPaid: model.isPaid ?? false,
      isDelivered: model.isDelivered ?? false,
      state: model.state ?? '',
      orderNumber: model.orderNumber ?? '',
      store: StoreModel.storeModelToEntity(model.store),
    );
  }
}
